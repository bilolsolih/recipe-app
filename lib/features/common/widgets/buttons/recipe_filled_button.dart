import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';

class RecipeFilledButton extends StatelessWidget {
  const RecipeFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.foregroundColor = AppColors.textWhite,
    this.backgroundColor = AppColors.redPinkMain,
    this.size = const Size(207, 45),
    this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
  });

  final String text;
  final Color foregroundColor, backgroundColor;
  final Size size;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        fixedSize: size,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
