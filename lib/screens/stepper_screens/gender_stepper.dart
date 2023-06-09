import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';

class GenderStepper extends StatelessWidget {
  const GenderStepper({super.key});

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
            onTap: () {},
            child: Container(
              height: 55,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.darkGrey),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Man",
                  style: AppStyles.text,
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
          onTap: () {},
          child: Container(
            height: 55,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.pink),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                "Woman",
                style: AppStyles.text.copyWith(color: AppColors.pink),
              ),
            ),
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 55,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.darkGrey),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Rabbit",
                  style: AppStyles.text,
                ),
              ),
            ),
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
