import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/file_path.dart';

class ProfileScreen extends StatelessWidget {
  final logoutAction;
  final String? name;
  final String? picture;
  ProfileScreen({this.logoutAction, this.name, this.picture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 16.h,
          ),
          image(context),
          Padding(
            padding: EdgeInsets.only(left: 38.0.w, top: 15.h),
            child: Column(
              children: [
                stats(
                  iconData: Icons.email,
                  text: "syedzainnaqvi3324@gmail.com",
                  context: context,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget stats({
    required IconData iconData,
    required String text,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 24.r,
          ),
          SizedBox(
            width: 24.w,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              color: Color(0xff5D5E5E),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(context) {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Icon(
                            Icons.logout,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 18.h, bottom: 18.h, right: 10.w),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                left: 0,
                right: 0,
                child: Container(
                  width: 404.w,
                  height: 270.h,
                  child: SvgPicture.asset(
                    "assets/svg/lines.svg",
                    color: Color(0xff466CB4),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 34.h,
                  ),
                  CircleAvatar(
                    radius: 50.h,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                      picture ?? '',
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 0,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/blur.svg",
                    color: Colors.red.withOpacity(0.04),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -MediaQuery.of(context).size.height * 0.78,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 187.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/svg/down.svg",
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: -MediaQuery.of(context).size.height * 0.77,
                right: 5,
                child: Container(
                  width: 64.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                      color: Color(0xff8B010B)),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            '${name}',
            style: TextStyle(
              color: Color(0xFF8B010B),
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Change karo subtitle likhna hai ",
            style: TextStyle(
              color: Color(0xff5D5E5E),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
