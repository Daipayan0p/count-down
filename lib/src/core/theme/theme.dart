import 'package:count_down/src/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Base text theme for consistent typography
final _baseTextTheme = TextTheme(
  headlineLarge: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
);

// Base input decoration theme
final _baseInputDecorationTheme = InputDecorationTheme(
  filled: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColor.gradient2, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.red, width: 1),
  ),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: AppColor.gradient2,
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  textTheme: _baseTextTheme.apply(
    bodyColor: const Color(0xFF2D3436),
    displayColor: const Color(0xFF2D3436),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: const Color(0xFFF8F9FA),
    foregroundColor: const Color(0xFF2D3436),
    titleTextStyle: _baseTextTheme.titleLarge?.copyWith(
      color: const Color(0xFF2D3436),
    ),
    iconTheme: const IconThemeData(color: AppColor.gradient2),
  ),
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: Colors.white,
    shadowColor: Colors.black.withOpacity(0.1),
  ),
  inputDecorationTheme: _baseInputDecorationTheme.copyWith(
    fillColor: Colors.grey[200]?.withValues(alpha: 0.8),
    hintStyle: TextStyle(color: Colors.grey[500]),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: AppColor.gradient2,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.gradient2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColor.gradient2,
    size: 24,
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey[200],
    space: 24,
    thickness: 1,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColor.gradient2,
    secondary: AppColor.gradient1,
    surface: Colors.white,
    background: const Color(0xFFF8F9FA),
    error: Colors.red[600]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: const Color(0xFF2D3436),
    onError: Colors.white,
    brightness: Brightness.light,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColor.gradient2,
  scaffoldBackgroundColor: AppColor.background,
  textTheme: _baseTextTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.background,
    foregroundColor: Colors.white,
    titleTextStyle: _baseTextTheme.titleLarge?.copyWith(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(color: AppColor.gradient2),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: AppColor.eventBackground,
  ),
  inputDecorationTheme: _baseInputDecorationTheme.copyWith(
    fillColor: AppColor.eventBackground,
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColor.gradient2,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.gradient2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColor.gradient2,
    size: 24,
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey[800],
    space: 24,
    thickness: 1,
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColor.gradient2,
    secondary: AppColor.gradient1,
    surface: AppColor.eventBackground,
    background: AppColor.background,
    error: Colors.red[400]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  ),
);
