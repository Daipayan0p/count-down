import 'package:count_down/src/core/theme/app_color.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith();
final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.background,
    appBarTheme: const AppBarTheme(
        color: AppColor.background
    )

);