import 'package:flutter/material.dart';
import 'package:lone_soul/constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';

class InterestStepper extends StatelessWidget {
  const InterestStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Interests",
            style: AppStyles.boldHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Let everyone know what you're interested\nin by adding it to your profile",
            style: AppStyles.text.copyWith(color: AppColors.grey),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: const BoxDecoration(),
          child: MultiSelectChipField(
            title: const Text('interests'),
            decoration: const BoxDecoration(color: Colors.white),
            showHeader: false,
            scrollBar: HorizontalScrollBar(isAlwaysShown: true),
            selectedChipColor: AppColors.pink,
            selectedTextStyle: AppStyles.text.copyWith(color: Colors.white),
            items: interests.map((e) => MultiSelectItem<String>(e, e)).toList(),
            //onTap: (item) {},
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
