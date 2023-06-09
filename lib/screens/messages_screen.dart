import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/widgets/match_message_item_widget.dart';
import 'package:lone_soul/widgets/message_item_widget.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  final names = const ['John', 'Doe', 'Randy', 'Millan', 'Rossy'];
  final messages = const [
    'Hey, How are you?',
    'How are you doing today?',
    'Great! See you then',
    'What? So sorry',
    'Okay, see you',
  ];
  final messageNames = const ['Rock', 'Noami', 'Sissy', 'Zele', 'Ebot'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'New Matches',
              style: AppStyles.boldHeader.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.pink,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 200,
              child: Row(
                children: List.generate(5, (index) {
                  return MatchMessageItemWidget(
                    name: names[index],
                    image: 'assets/images/p${index + 2}.jpeg',
                    onTap: () {},
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Messages',
              style: AppStyles.boldHeader.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.pink,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(5, (index) {
            return MessageItemWidget(
              image: 'assets/images/p${index + 2}.jpeg',
              name: messageNames[index],
              message: messages[index],
              onTap: () {},
            );
          }),
        ],
      ),
    );
  }
}
