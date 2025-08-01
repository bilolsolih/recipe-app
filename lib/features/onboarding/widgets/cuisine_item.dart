import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/features/common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:recipe/features/common/widgets/buttons/recipe_filled_button.dart';
import 'package:recipe/features/common/widgets/buttons/recipe_icon_button.dart';
import 'package:recipe/features/onboarding/managers/cuisines_view_model.dart';

class CuisineItem extends StatelessWidget {
  const CuisineItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
  });

  final int id;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            image,
            width: 99.r,
            height: 99.r,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.textWhite,
            fontSize: 13.r,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
