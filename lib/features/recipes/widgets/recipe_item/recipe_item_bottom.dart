import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeItemBottom extends StatelessWidget {
  const RecipeItemBottom({
    super.key,
    required this.title,
    required this.description,
    required this.rating,
    required this.time,
  });

  final num rating, time;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 159.w,
        height: 76.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(color: AppColors.pinkSub, width: 1),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14.r),
          ),
        ),
        child: Column(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.beige,
                fontSize: 12.spMin,
                height: 1.18,
              ),
            ),
            Text(
              description,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.beige,
                fontFamily: "League Spartan",
                fontWeight: FontWeight.w300,
                fontSize: 13.spMin,
                height: 1.15,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5.w,
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: AppColors.pinkSub,
                        fontSize: 12.r,
                      ),
                    ),
                    SvgPicture.asset("assets/icons/star.svg"),
                  ],
                ),
                Row(
                  spacing: 5.w,
                  children: [
                    SvgPicture.asset("assets/icons/clock.svg"),
                    Text(
                      "$time min",
                      style: TextStyle(
                        color: AppColors.pinkSub,
                        fontSize: 12.r,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
