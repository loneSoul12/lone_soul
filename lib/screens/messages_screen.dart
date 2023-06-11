import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/global_user.dart';
import 'package:lone_soul/models/match.dart';
import 'package:lone_soul/models/preference.dart';
import 'package:lone_soul/models/user.dart';
import 'package:lone_soul/services/db/conversation_db_methods.dart';
import 'package:lone_soul/services/db/match_db_methods.dart';
import 'package:lone_soul/widgets/match_message_item_widget.dart';
import 'package:lone_soul/widgets/message_item_widget.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final names = const ['John', 'Doe', 'Randy', 'Millan', 'Rossy'];

  final messages = const [
    'Hey, How are you?',
    'How are you doing today?',
    'Great! See you then',
    'What? So sorry',
    'Okay, see you',
  ];

  final messageNames = const ['Rock', 'Noami', 'Sissy', 'Zele', 'Ebot'];

  List<MatchUser>? matches;
  List<AppUser>? conversations;

  Future<void> getMatches() async {
    setState(() {
      matches = null;
    });

    final matchess = await MatchDBMethods().searchForMatches(
      globalUser!.userId ?? '',
      Preference(
        gender: 'man',
        maxAge: 25,
        minAge: 18,
        userId: globalUser!.userId,
      ),
    );

    setState(() {
      matches = matchess;
    });
  }

  Future<void> getConversations() async {
    setState(() {
      this.conversations = null;
    });

    final conversations = await ConversationDBMethods().getConversations(
      globalUser!.userId ?? '',
    );

    setState(() {
      this.conversations = conversations;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    setState(() {
      conversations = null;
      matches = null;
    });

    final requests = [
      getMatches(),
      getConversations(),
    ];

    await Future.wait(requests);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: init,
      color: AppColors.pink,
      child: SingleChildScrollView(
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
            if (matches == null)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 200,
                  child: Row(
                    children: List.generate(5, (index) {
                      return MatchMessageItemWidget(
                        user: matches![index],
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
            if (conversations == null)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              )
            else if (conversations!.length == 0)
              const Text('No Conversations available')
            else
              ...List.generate(5, (index) {
                return MessageItemWidget(
                  user: conversations![index],
                  onTap: () {},
                );
              }),
          ],
        ),
      ),
    );
  }
}
