import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/screens/stepper_screens/age_stepper.dart';
import 'package:lone_soul/screens/stepper_screens/gender_stepper.dart';
import 'package:lone_soul/screens/stepper_screens/interest_stepper.dart';
import 'package:lone_soul/screens/stepper_screens/location.dart';
import 'package:lone_soul/screens/stepper_screens/name_stepper.dart';
import 'package:lone_soul/screens/stepper_screens/profile_photo_stepper.dart';

class MainStepper extends StatefulWidget {
  const MainStepper({super.key});

  @override
  State<MainStepper> createState() => _MainStepperState();
}

class _MainStepperState extends State<MainStepper> {
  int value = 1;

  void changeStepper() {
    value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stepperScreens = [
      NameStepper(
        changeStepper: () {
          changeStepper();
        },
      ),
      AgeStepper(changeStepper: () {
        changeStepper();
      }),
      GenderStepper(
        changeStepper: () {
          changeStepper();
        },
      ),
      LocationStepper(
        changeStepper: () {
          changeStepper();
        },
      ),
      InterestStepper(
        changeStepper: () {
          changeStepper();
        },
      ),
      ProfilePhotoStepper()
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 35,
              // ),
              LinearProgressIndicator(
                value: (value / 6),
                backgroundColor: AppColors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.pink),
              ),
              const SizedBox(
                height: 50,
              ),
              stepperScreens[value - 1],
            ],
          ),
        ),
      ),
    );
  }
}
