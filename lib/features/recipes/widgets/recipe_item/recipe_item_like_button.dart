import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeItemLikeButton extends StatefulWidget {
  const RecipeItemLikeButton({
    super.key,
  });

  @override
  State<RecipeItemLikeButton> createState() => _RecipeItemLikeButtonState();
}

class _RecipeItemLikeButtonState extends State<RecipeItemLikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 7.h,
      right: 8.w,
      child: IconButton(
        onPressed: () {
          isLiked = !isLiked;
          setState(() {});
        },
        padding: EdgeInsets.zero,
        constraints: BoxConstraints.tight(
          Size.square(28.r),
        ),
        style: IconButton.styleFrom(
          backgroundColor: isLiked ? AppColors.redPinkMain : AppColors.pink,
          fixedSize: Size.square(28.r),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: SvgPicture.asset(
          "assets/icons/heart.svg",
          colorFilter: ColorFilter.mode(
            isLiked ? Colors.white : AppColors.pinkSub,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
