import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 35,
            ),
            LinearProgressIndicator(
              value: 0.1,
              backgroundColor: AppColors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.pink),
            ),
            SizedBox(
              height: 50,
            ),
            InterestStepper()
          ],
        ),
      ),
    );
  }
}
