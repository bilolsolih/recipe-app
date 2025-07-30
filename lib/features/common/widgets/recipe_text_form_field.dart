import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/core/utils/styles.dart';

class RecipeTextFormField extends StatefulWidget {
  const RecipeTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.validator,
    this.isPassword = false,
  });

  final String? Function(String?) validator;
  final TextEditingController controller;
  final String label, hintText;

  final bool isPassword;

  @override
  State<RecipeTextFormField> createState() => _RecipeTextFormFieldState();
}

class _RecipeTextFormFieldState extends State<RecipeTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: AppColors.textWhite,
            fontSize: 15.r,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.pink,
            hintText: widget.hintText,
            hintStyle: AppStyles.hintStyle,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/password.svg",
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 36.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
