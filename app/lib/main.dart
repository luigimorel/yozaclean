import 'package:apps/screens/login_screen.dart';
import 'package:apps/screens/onboarding_screen.dart';
import 'package:apps/screens/otp_screen.dart';
import 'package:apps/screens/signup_screen.dart';
import 'package:apps/themes/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// Root of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const OnboardingScreen(),
        "/signup": (context) => const SignUp(),
        "/otp": (context) => const OTP(),
        "login": (context) => const Login(),
      },
      initialRoute: "/",
      title: 'YozaClean',
      theme: CustomTheme.defaultTheme,
    );
  }
}
