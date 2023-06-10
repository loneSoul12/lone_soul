import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/text_field_controller.dart';

class LocationStepper extends StatefulWidget {
  const LocationStepper({super.key, this.changeStepper});
  final Function? changeStepper;

  @override
  State<LocationStepper> createState() => _LocationStepperState();
}

class _LocationStepperState extends State<LocationStepper> {
  @override
  void initState() {
    locationCreateAccountField = TextEditingController();
    locationCreateAccountFocus = FocusNode();
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
            "I Live in",
            style: AppStyles.boldHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: 150,
            child: TextFormField(
              autofocus: true,
              controller: locationCreateAccountField,
              focusNode: locationCreateAccountFocus,
              cursorColor: AppColors.brown,
              decoration: InputDecoration(hintText: 'Buea'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "This is how it will appear on Lone soul",
            style: AppStyles.text.copyWith(color: AppColors.grey, fontSize: 14),
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
