import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/screens/email_screen.dart';
import 'package:lone_soul/screens/signin_screen.dart';

class AuthStartScreen extends StatelessWidget {
  const AuthStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.gradient,
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lone Soul",
                      style: AppStyles.boldHeader.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      "   By Tapping Create Account or Sign in you\nagree to our Terms.Learn how we process your\n data in our Privacy Policy and Cookies Policy",
                      style: AppStyles.text
                          .copyWith(fontSize: 14, color: Colors.white38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        //NextScreen emailScreen
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EmailScreen()));
                      },
                      child: Container(
                        height: 55,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: AppStyles.text,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        //next screen sign in screen
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SigninScreen()));
                      },
                      child: Container(
                        height: 55,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: AppStyles.text.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ],
    ));
  }
}
