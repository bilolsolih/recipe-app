import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/core/utils/styles.dart';
import 'package:recipe/features/recipes/pages/categories_page.dart';
import 'package:recipe/features/recipes/pages/category_detail_page.dart';

import '../buttons/recipe_icon_button.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.id,
  });

  final int id;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CategoryDetailPage(categoryId: id, title: title),
          ),
        );
      },
      child: Container(
        height: 25.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.redPinkMain : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.redPinkMain,
          ),
        ),
      ),
    );
  }
}
