import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyles {
  static final title = TextStyle(
    color: AppColors.redPinkMain,
    fontSize: 20.r,
    fontWeight: FontWeight.w600,
  );

  static final hintStyle = TextStyle(
    color: AppColors.beige.withValues(alpha: 0.45),
    fontWeight: FontWeight.w500,
    fontSize: 16.r,
  );
}
