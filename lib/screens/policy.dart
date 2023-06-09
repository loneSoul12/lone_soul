import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/constants.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Welcome to Lone Soul.",
                  style: AppStyles.boldHeader,
                ),
                Text(
                  "Please follow these house rules",
                  style: AppStyles.text.copyWith(color: AppColors.grey),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ...List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: AppColors.pink,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        policies[index].title,
                        style: AppStyles.text,
                      ),
                    ],
                  ),
                  Text(
                    policies[index].description,
                    style: AppStyles.text.copyWith(color: AppColors.grey),
                  )
                ],
              ),
            );
          }),
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
                    "I agree",
                    style: AppStyles.text.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
