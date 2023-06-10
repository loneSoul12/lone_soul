import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/utils/text_field_controller.dart';

class NameStepper extends StatefulWidget {
  const NameStepper({super.key, this.changeStepper});
  final Function? changeStepper;

  @override
  State<NameStepper> createState() => _NameStepperState();
}

class _NameStepperState extends State<NameStepper> {
  final nameKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    nameCreateAccountField = TextEditingController();
    nameCreateAccountFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "My name is",
            style: AppStyles.boldHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: 150,
            child: TextFormField(
              key: nameKey,
              validator: (input) {
                if (input!.isEmpty) {
                  return 'please Enter your name';
                }
                if (input.length < 3) {
                  return "Your name should be at least 3 character long";
                }
              },
              focusNode: nameCreateAccountFocus,
              controller: nameCreateAccountField,
              cursorColor: AppColors.brown,
              decoration: InputDecoration(hintText: 'John Cena'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "This is how it will appear on Lone soul\nand you will not be able to change it",
            style: AppStyles.text.copyWith(color: AppColors.grey, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
            child: InkWell(
          onTap: () {
            if (nameKey.currentState!.validate()) {
              widget.changeStepper!();
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
        ))
      ],
    );
  }
}
