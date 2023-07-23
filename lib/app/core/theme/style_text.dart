import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_fond_sized.dart';

abstract class AppTextStyle {
  //display textStyle
  static final TextStyle displayLarge = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.fontSize36,
  );
  static final TextStyle displayMedium = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.fontSize30,
  );
  static final TextStyle displaySmall = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.fontSize26,
  );
  // headline textStyle
  static final TextStyle headlineMedium = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.fontSize24,
  );
  static final TextStyle headlineSmall = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.fontSize20,
  );
  //title textStyle
  static final TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize18,
  );
  static final TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize16,
  );
  static final TextStyle titleSmall = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize14,
  );
  // body textStyle
  static final TextStyle bodySmall = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize12,
  );
  static final TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize14,
  );
  static final TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize16,
  );
  // label textStyle
  static final TextStyle labelLarge = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize18,
  );
  static final TextStyle labelSmall = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: AppFontSize.fontSize14,
  );
  // extra
  static final TextStyle button = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontSize: AppFontSize.fontSize16,
  );
}
