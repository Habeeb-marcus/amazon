import 'package:flutter/material.dart';

class TAppBarTheme{
  TAppBarTheme._();


  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: const Color.fromARGB(221, 231, 234, 226),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Color.fromARGB(221, 10, 13, 31),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    ),
  );
}