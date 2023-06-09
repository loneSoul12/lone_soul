import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/screens/signin_screen.dart';

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
      home: const SigninScreen(),
    );
  }
}
