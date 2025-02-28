import 'package:amazon/core/router/app_router.dart';
import 'package:amazon/core/themes/theme.dart';
import 'package:amazon/features/auth/presentation/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const Amazon()));
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
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
