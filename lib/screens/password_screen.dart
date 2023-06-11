import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/user.dart';
import 'package:lone_soul/screens/stepper_screens/main_stepper.dart';
import 'package:lone_soul/services/auth/user_auth_methods.dart';
import 'package:lone_soul/utils/text_field_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key, this.user});
  final AppUser? user;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordKey = GlobalKey<FormFieldState>();
  final auth = UserAuthentication();
  // late final StreamSubscription<AuthState> _authStateSubscription;
  bool isLoading = false;
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
            onPressed: () {
              Navigator.pop(context);
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
                "Set your\nPassword",
                style: AppStyles.boldHeader,
              ),
              Text(
                "Don't forget your password",
                style: AppStyles.text.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: passwordKey,
                onChanged: (value) {
                  widget.user?.password = value;
                  setState(() {});
                },
                controller: passwordCreateAccountField,
                focusNode: passwordCreateAccountFocus,
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please set a your pasword';
                  }
                },
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
                  onTap: () async {
                    if (passwordKey.currentState!.validate()) {
                      //next screen NameStepperScreen
                      setState(() {
                        isLoading = true;
                      });
                      final id =
                          await auth.signUpEmailAndPassword(widget.user!);
                      widget.user!.userId = id;
                      print(
                          "{${auth.supabaseInstance.client.auth.currentSession}\n\n");
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return MainStepper(
                          user: widget.user,
                        );
                      }));
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
                      child: isLoading
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            )
                          : Text(
                              "Continue",
                              style:
                                  AppStyles.text.copyWith(color: Colors.white),
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
