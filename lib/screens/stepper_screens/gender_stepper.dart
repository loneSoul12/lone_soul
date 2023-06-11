import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/user.dart';

class GenderStepper extends StatefulWidget {
  const GenderStepper({super.key, this.changeStepper, this.user});
  final Function? changeStepper;
  final AppUser? user;

  @override
  State<GenderStepper> createState() => _GenderStepperState();
}

class _GenderStepperState extends State<GenderStepper> {
  String gender = 'man';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "I am a",
            style: AppStyles.boldHeader,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: InkWell(
            onTap: () {
              setState(() {
                gender = 'man';
                widget.user?.gender = gender;
              });
            },
            child: Container(
              height: 55,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: gender == 'man'
                          ? AppColors.pink
                          : AppColors.darkGrey),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Man",
                  style: AppStyles.text.copyWith(
                      color: gender == 'man'
                          ? AppColors.pink
                          : AppColors.darkGrey),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: InkWell(
          onTap: () {
            gender = 'woman';
            widget.user?.gender = gender;
            setState(() {});
          },
          child: Container(
            height: 55,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(
                    color: gender == 'woman'
                        ? AppColors.pink
                        : AppColors.darkGrey),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "Woman",
                style: AppStyles.text.copyWith(
                    color: gender == 'woman'
                        ? AppColors.pink
                        : AppColors.darkGrey),
              ),
            ),
          ),
        )),
        const SizedBox(
          height: 100,
        ),
        Center(
            child: InkWell(
          onTap: () {
            widget.changeStepper!();
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
