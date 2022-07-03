import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sjipment/screens/login_page.dart';
import 'package:sjipment/screens/profile_page.dart';

const FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

//  ------------------------------
///     Auth Variables
///  ------------------------------
const AUTH0_DOMAIN = 'sjipment.eu.auth0.com';
const AUTH0_CLIENT_ID = 'BxDBKRUqgtOx7pPdrQGqrUECgTm8je6i';

const AUTH0_REDIRECT_URI = 'com.example.sjipment://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String? errorMessage;
  String? name;
  String? picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isBusy
            ? CircularProgressIndicator()
            : isLoggedIn
                ? ProfileScreen(
                    logoutAction: logoutAction,
                    name: name!.split('@').first,
                    picture: picture,
                  )
                : Login(loginAction, errorMessage, isLoggedIn),
      ),
    );
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<Map> getUserDetails(String accessToken) async {
    const url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details.');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = false;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse? result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login'],
        ),
      );

      final idToken = parseIdToken(result!.idToken.toString());
      final profile = await getUserDetails(result.accessToken.toString());

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('Login error $e-stack:$s');
      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  @override
  void initState() {
    initAction();
    super.initState();
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response!.idToken.toString());
      final profile = await getUserDetails(response!.accessToken.toString());

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refreseh token: $e - stack $s');
      logoutAction();
    }
  }
}
