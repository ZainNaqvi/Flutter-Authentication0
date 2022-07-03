import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sjipment/screens/home_page.dart';
import 'package:sjipment/utils/file_path.dart';

class Login extends StatefulWidget {
  final loginAction;
  final String? loginError;
  final bool? isLoggedIn;

  const Login(
    this.loginAction,
    this.loginError,
    this.isLoggedIn,
  );

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isLoggedIn == false) {
      Timer(Duration(seconds: 5), finished);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  void finished() {
    widget.loginAction();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Welcome!",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Cursive"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120.w,
                height: 120.h,
                child: SvgPicture.asset(
                  FilePath.appLogo,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
