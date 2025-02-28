import 'package:amazon/features/auth/presentation/auth_screen/auth_screen.dart';
import 'package:amazon/features/auth/presentation/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String authRoute = "authEmail";
  static const String otpPageRoute = "otpPage";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case otpPageRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
    }
  }
}
