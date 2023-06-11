import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/global_user.dart';
import 'package:lone_soul/models/match.dart';
import 'package:lone_soul/models/preference.dart';
import 'package:lone_soul/screens/swipe_screen.dart';
import 'package:lone_soul/services/db/match_db_methods.dart';
import 'package:lone_soul/widgets/home_item_widget.dart';

class HomeScreenPortion extends StatefulWidget {
  final Preference? preference;
  const HomeScreenPortion({super.key, this.preference});

  @override
  State<HomeScreenPortion> createState() => _HomeScreenPortionState();
}

class _HomeScreenPortionState extends State<HomeScreenPortion> {
  final names = const ['John', 'Doe', 'Randy', 'Millan', 'Rossy', 'Missy'];

  final ages = const [29, 18, 30, 23, 20, 50];

  List<MatchUser>? matches;

  Future<void> getMatches() async {
    setState(() {
      matches = null;
    });

    final matchess = await MatchDBMethods().searchForMatches(
      globalUser!.userId ?? '',
      widget.preference ??
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getMatches,
      color: AppColors.pink,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: matches == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3.5 / 4,
                shrinkWrap: true,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: List.generate(
                  matches!.length,
                  (index) => HomeItemWidget(
                    user: matches![index],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) =>
                              SwipeScreen(users: matches!.sublist(index))));
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
