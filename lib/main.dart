import 'package:amazon/utils/themes/theme.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const AuthScreen(),
    );
  }
}
