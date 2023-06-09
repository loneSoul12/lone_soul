import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';

class ProfilePhotoStepper extends StatelessWidget {
  const ProfilePhotoStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Add Profile Photo",
            style: AppStyles.boldHeader,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Stack(children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 200,
                      width: 120,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.587,
            top: MediaQuery.of(context).size.height * 0.247,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: AppColors.buttonGradient,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ])
      ],
    );
  }
}
