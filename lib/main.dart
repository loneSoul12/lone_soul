import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/screens/auth_start_screen.dart';
import 'package:lone_soul/screens/email_screen.dart';
import 'package:lone_soul/screens/password_screen.dart';
import 'package:lone_soul/screens/policy.dart';
import 'package:lone_soul/screens/preference_screen.dart';
import 'package:lone_soul/screens/signin_screen.dart';
import 'package:lone_soul/screens/stepper_screens/main_stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: AppColors.brown,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.brown),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: SigninScreen(),
    );
  }
}
