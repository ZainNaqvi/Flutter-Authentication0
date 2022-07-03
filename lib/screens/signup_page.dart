import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sjipment/widgets/themes.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.mainGreenColor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 70.h),
          Container(
            width: 375.w,
            height: 740.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  40.r,
                ),
                topRight: Radius.circular(
                  40.r,
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 20.5.w,
                  height: 1.h,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Here\'s\nyour First\nstep With\nUs!',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 120.w,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 86.95,
                                width: 86.95,
                                child: SvgPicture.asset(
                                  'assets/svg/login_logo.svg',
                                ),
                              ),
                              Text(
                                'Sijpment',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                  color: CustomTheme.mainGreenColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: getInputDecoration(
                          hintText: 'FirstName',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: getInputDecoration(
                          hintText: 'LastName',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: getInputDecoration(
                          hintText: 'Abce@gmail.com',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: getInputDecoration(
                          hintText: '***********',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: CustomTheme.mainGreenColor,
                            elevation: 20,
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  InputDecoration getInputDecoration(
      {required String hintText, required Widget prefixIcon}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        borderSide: BorderSide(
          color: CustomTheme.mainBorderColor,
          width: 1.0.w,
          style: BorderStyle.solid,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        borderSide: BorderSide(
          color: CustomTheme.mainBorderColor,
          width: 1.0.w,
          style: BorderStyle.solid,
        ),
      ),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16.h,
      ),
      hintText: hintText,
      prefixIcon: prefixIcon,
      // suffixIcon: SvgPicture.asset(
      //   'assets/svg/circle_checkMark.svg',
      //   fit: BoxFit.scaleDown,
      //   width: 20.h,
      //   height: 20.h,
      // ),
    );
  }
}
