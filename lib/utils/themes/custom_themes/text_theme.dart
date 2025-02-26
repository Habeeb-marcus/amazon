import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    titleSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),

    bodyLarge: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
    bodySmall: const TextStyle().copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),

    labelMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    labelSmall: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
    
  );

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),

    labelMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    labelSmall: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  );
}