import 'package:flutter/material.dart';
import 'package:lone_soul/constants.dart';
import 'package:lone_soul/models/interests.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';

class InterestStepper extends StatefulWidget {
  const InterestStepper({super.key, this.changeStepper});
  final Function? changeStepper;

  @override
  State<InterestStepper> createState() => _InterestStepperState();
}

class _InterestStepperState extends State<InterestStepper> {
  List<Interest> selectedInterest = [];
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

          child: MultiSelectChipDisplay(
            colorator: (p0) {
              if (p0.isSelected!) {
                return AppColors.pink;
              } else {
                return Color.fromARGB(255, 160, 148, 148);
              }
            },
            textStyle: AppStyles.text.copyWith(color: Colors.white),
            items: interestList
                .map((e) => MultiSelectItem<Interest>(e, e.interestName!))
                .toList(),
            onTap: (item) {
              if (item.isSelected!) {
                item.isSelected = false;
                selectedInterest.remove(item);
                setState(() {});
              } else {
                item.isSelected = true;
                selectedInterest.add(item);
                setState(() {});
              }
            },
            //onSaved: ,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
            child: InkWell(
          onTap: () {
            if (selectedInterest.isEmpty) {
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
                            "Please Select atleast 1 interest",
                            style: AppStyles.text.copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              //navigate to next screen with selected list passed;
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
