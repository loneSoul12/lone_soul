import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/utils/text_field_controller.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  void initState() {
    emailCreateAccountField = TextEditingController();
    emailCreateAccountFocus = FocusNode();
    super.initState();
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
                "What's Your\nEmail",
                style: AppStyles.boldHeader,
              ),
              Text(
                "Dont loose access to your account\nverify your email",
                style: AppStyles.text.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailCreateAccountField,
                focusNode: emailCreateAccountFocus,
                autofocus: true,
                cursorColor: AppColors.brown,
                decoration: InputDecoration(hintText: 'janroyal@gmail.com'),
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
