import 'package:flutter/material.dart';
import 'package:lone_soul/widgets/home_item_widget.dart';

class HomeScreenPortion extends StatelessWidget {
  const HomeScreenPortion({super.key});

  final names = const ['John', 'Doe', 'Randy', 'Millan', 'Rossy', 'Missy'];
  final ages = const [29, 18, 30, 23, 20, 50];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.5 / 4,
        shrinkWrap: true,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: List.generate(
          6,
          (index) => HomeItemWidget(
            age: ages[index],
            image: 'assets/images/p${index + 1}.jpeg',
            onTap: () {},
            name: names[index],
          ),
        ),
      ),
    );
  }
}
