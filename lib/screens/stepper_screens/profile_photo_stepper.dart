import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/models/user.dart';
import 'package:lone_soul/services/db/user_db_methods.dart';
import 'package:lone_soul/utils/pick_image.dart';

class ProfilePhotoStepper extends StatefulWidget {
  const ProfilePhotoStepper({super.key, this.user});
  final AppUser? user;

  @override
  State<ProfilePhotoStepper> createState() => _ProfilePhotoStepperState();
}

class _ProfilePhotoStepperState extends State<ProfilePhotoStepper> {
  final db = UserDBMethods();
  bool isLoading = false;
  XFile? photo;
  final imagePicker = PickImage();
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
                        child: photo != null
                            ? Image.file(
                                File(photo!.path),
                                fit: BoxFit.cover,
                              )
                            : const SizedBox()),
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
              onTap: () {
                showModalBottomSheet(
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      photo = await imagePicker
                                          .pickImageFromCamera();
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.camera,
                                      color: AppColors.brown,
                                      size: 30,
                                    )),
                                Text(
                                  "Camera",
                                  style: AppStyles.text,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      photo = await imagePicker
                                          .pickImageFromGallery();
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.photo,
                                      color: AppColors.brown,
                                      size: 30,
                                    )),
                                Text(
                                  "Gallery",
                                  style: AppStyles.text,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    });
              },
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
        ]),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () async {
            if (photo == null) {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                                color: AppColors.pink,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "ok",
                                style: AppStyles.text
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                      content: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Please set your profile photo",
                            style: AppStyles.text.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              //create account and navigate to preference screen
              print(widget.user.toString());
              isLoading = true;
              await db.insertUser(widget.user!, photo!);
              setState(() {});
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
                      color: Colors.white,
                      strokeWidth: 2.0,
                    )
                  : Text(
                      "Continue",
                      style: AppStyles.text.copyWith(color: Colors.white),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
