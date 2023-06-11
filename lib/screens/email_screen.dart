import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/user.dart';
import 'package:lone_soul/screens/password_screen.dart';
import 'package:lone_soul/utils/text_field_controller.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final emailkey = GlobalKey<FormFieldState>();
  var user = AppUser();
  @override
  void initState() {
    emailCreateAccountField = TextEditingController();
    emailCreateAccountFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailCreateAccountField!.dispose();
    emailCreateAccountFocus!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              Navigator.of(context).pop();
            },
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
                key: emailkey,
                onChanged: (value) {
                  user.email = value;
                  setState(() {});
                },
                controller: emailCreateAccountField,
                focusNode: emailCreateAccountFocus,
                autofocus: true,
                cursorColor: AppColors.brown,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(input)) {
                    return "please enter a valid email";
                  }
                },
                decoration: InputDecoration(
                    hintStyle: AppStyles.text
                        .copyWith(fontSize: 12, color: AppColors.grey),
                    hintText: 'e.g: janroyal@gmail.com'),
              ),
              const SizedBox(height: 50),
              Center(
                child: InkWell(
                  onTap: () {
                    if (emailkey.currentState!.validate()) {
                      //NextScreen password screen.
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PasswordScreen(user: user)));
                    }
                  },
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
