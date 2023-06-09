import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome Back!",
                style: AppStyles.boldHeader,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                cursorColor: AppColors.brown,
                decoration: InputDecoration(
                    hintText: 'Enter your Email. e.g johncena@gmail.com',
                    hintStyle: AppStyles.text
                        .copyWith(color: AppColors.grey, fontSize: 13),
                    label: const Text("Email"),
                    labelStyle:
                        AppStyles.text.copyWith(color: AppColors.brown)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: TextFormField(
                obscureText: true,
                cursorColor: AppColors.brown,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: AppStyles.text
                        .copyWith(color: AppColors.grey, fontSize: 13),
                    label: const Text("Password"),
                    labelStyle: AppStyles.text.copyWith(color: AppColors.brown),
                    suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility_off,
                          color: AppColors.grey,
                        ))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      gradient: AppColors.buttonGradient,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: AppStyles.text.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
