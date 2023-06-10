import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/text_field_controller.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  void initState() {
    passwordCreateAccountField = TextEditingController();
    passwordCreateAccountFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    passwordCreateAccountField!.dispose();
    passwordCreateAccountFocus!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.darkGrey,
            )),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Set your\nPassword",
                style: AppStyles.boldHeader,
              ),
              Text(
                "Don\'t forget your password",
                style: AppStyles.text.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordCreateAccountField,
                focusNode: passwordCreateAccountFocus,
                cursorColor: AppColors.brown,
                decoration: InputDecoration(
                  hintText: 'Set your password here',
                  hintStyle: AppStyles.text
                      .copyWith(color: AppColors.grey, fontSize: 15),
                ),
              ),
              const SizedBox(height: 50),
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
                        "Continue",
                        style: AppStyles.text.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
