import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/client.dart';
import 'package:recipe/features/common/widgets/app_bars/recipe_app_bar_main.dart';
import 'package:recipe/features/recipes/pages/category_detail_page.dart';

import '../../common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
  });

  final int id;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryDetailPage(categoryId: id, title: title),
          ),
        );
      },
      child: Column(
        spacing: 6.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13.r),
            child: Image.network(
              image,
              width: 159.w,
              height: 145.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
