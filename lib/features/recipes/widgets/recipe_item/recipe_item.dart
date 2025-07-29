import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'recipe_item_bottom.dart';
import 'recipe_item_like_button.dart';
import 'recipe_item_top.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final Map<String, dynamic> recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169.w,
        height: 226.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            RecipeItemBottom(
              title: recipe['title'],
              description: recipe['description'],
              rating: recipe['rating'],
              time: recipe['timeRequired'],
            ),
            RecipeItemTop(image: recipe['photo']),
            RecipeItemLikeButton(),
          ],
        ),
      ),
    );
  }
}
