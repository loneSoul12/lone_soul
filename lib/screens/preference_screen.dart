import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/constants.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/horizontal_scrollbar.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  String genderPreference = 'Men';
  double startval1 = 20, endval1 = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 226, 224, 224),
        title: Text(
          "Preference Settings",
          style: AppStyles.boldHeader.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Done",
                style: AppStyles.text.copyWith(color: AppColors.pink),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Show me",
                      style: AppStyles.text,
                    ),
                    DropdownButton(
                        value: genderPreference,
                        items: [
                          DropdownMenuItem(
                            value: 'Men',
                            child: Text(
                              "Men",
                              style: AppStyles.text,
                            ),
                          ),
                          DropdownMenuItem(
                              value: 'Women',
                              child: Text(
                                "Women",
                                style: AppStyles.text,
                              )),
                          DropdownMenuItem(
                              value: 'Both',
                              child: Text(
                                "Both",
                                style: AppStyles.text,
                              ))
                        ],
                        onChanged: (item) {
                          genderPreference = item!;
                          setState(() {});
                        })
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Age Preference",
                          style: AppStyles.text,
                        ),
                        Text(
                          "${startval1.toInt()} - ${endval1.toInt()}",
                          style: AppStyles.text,
                        ),
                      ],
                    ),
                    RangeSlider(
                      activeColor: AppColors.pink,
                      min: 18,
                      max: 90,
                      divisions: 72,
                      labels: RangeLabels("age: ${startval1.toInt()}",
                          "age: ${endval1.toInt()}"),
                      values: RangeValues(startval1, endval1),
                      onChanged: (RangeValues value) {
                        setState(() {
                          startval1 = value.start;
                          endval1 = value.end;
                        });
                      },
                    )
                  ],
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Interests",
                      style: AppStyles.text,
                    ),
                    MultiSelectChipField(
                      title: Text('interests'),
                      decoration: BoxDecoration(color: Colors.white),
                      showHeader: false,
                      scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                      selectedChipColor: AppColors.pink,
                      selectedTextStyle:
                          AppStyles.text.copyWith(color: Colors.white),
                      items: interests
                          .map((e) => MultiSelectItem<String>(e, e))
                          .toList(),
                      //onTap: (item) {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Color.fromARGB(255, 226, 224, 224),
        ))
      ]),
    );
  }
}
