import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';

class BottomNavigationBarMain extends StatelessWidget {
  const BottomNavigationBarMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 34.h),
      child: Container(
        width: 281.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/icons/home.svg"),
            SvgPicture.asset("assets/icons/community.svg"),
            SvgPicture.asset("assets/icons/categories.svg"),
            SvgPicture.asset("assets/icons/profile.svg"),
          ],
        ),
      ),
    );
  }
}