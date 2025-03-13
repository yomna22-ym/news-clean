import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_cleanarch/core/colors_manager.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
      dividerTheme: DividerThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorsManager.textColor,
            fontSize: 20.sp,
          )));
}
