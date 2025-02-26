import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/themes/custom_themes/appBar_theme.dart';
import 'package:amazon/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade100),
  useMaterial3: true,
  textTheme: TTextTheme.lightTextTheme,
  appBarTheme: TAppBarTheme.lightAppBarTheme,
scaffoldBackgroundColor:  AppColors.lightGrey,
   );

  static ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade100,brightness: Brightness.dark),
  useMaterial3: true,
  textTheme: TTextTheme.darkTextTheme,
  appBarTheme: TAppBarTheme.darkAppBarTheme
  );


}

// ThemeData theme = ThemeData(
//   textTheme: TextTheme(
//     displayLarge: TextStyle(
//       color: C,
//       fontSize: 26,
//     ),
//     displayMedium: TextStyle(
//       color: black,
//       fontSize: 24,
//     ),
//     displaySmall: TextStyle(
//       color: black,
//       fontSize: 22,
//     ),
//     bodyLarge: TextStyle(
//       color: black,
//       fontSize: 20,
//     ),
//     bodyMedium: TextStyle(
//       color: black,
//       fontSize: 18,
//     ),
//     bodySmall: TextStyle(
//       color: black,
//       fontSize: 16,
//     ),
//     labelMedium: TextStyle(
//       color: black,
//       fontSize: 14,
//     ),
//     labelSmall: TextStyle(
//       color: black,
//       fontSize: 12,
//     ),
//   ),
// );
