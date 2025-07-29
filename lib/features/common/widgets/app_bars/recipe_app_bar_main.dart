import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/core/utils/styles.dart';
import 'package:recipe/features/common/widgets/buttons/recipe_icon_button.dart';

class RecipeAppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarMain({
    super.key,
    required this.title,
    this.bottom,
    this.toolbarHeight = 56,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size(
    double.infinity,
    bottom != null ? bottom!.preferredSize.height + toolbarHeight : toolbarHeight,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Align(
        alignment: Alignment.centerRight,
        child: RecipeIconButton(
          icon: "assets/icons/back-arrow.svg",
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.redPinkMain,
          onPressed: () {},
        ),
      ),
      centerTitle: true,
      title: Text(title, style: AppStyles.title),
      actionsPadding: EdgeInsets.only(right: 37.w),
      actions: [
        RecipeIconButton(icon: "assets/icons/notification.svg", onPressed: () {}),
        SizedBox(width: 5.w),
        RecipeIconButton(icon: "assets/icons/search.svg", onPressed: () {}),
      ],
      bottom: bottom,
    );
  }
}
