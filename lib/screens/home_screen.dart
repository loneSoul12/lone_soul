import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/app_styles.dart';
import 'package:lone_soul/global_user.dart';
import 'package:lone_soul/models/preference.dart';
import 'package:lone_soul/screens/home_screen_portion.dart';
import 'package:lone_soul/screens/messages_screen.dart';
import 'package:lone_soul/screens/preference_screen.dart';
import 'package:lone_soul/services/db/user_db_methods.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Preference? preference;

  List<Widget> getPages() => [
        HomeScreenPortion(
          preference: preference,
          key: ValueKey(preference),
        ),
        const MessagesScreen(),
      ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (globalUser == null) {
      init();
    }
  }

  void init() async {
    globalUser = await UserDBMethods()
        .getUser(Supabase.instance.client.auth.currentUser?.id ?? '');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Lone Soul',
          style: AppStyles.boldHeader.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
          colors: const [
            AppColors.brown,
            AppColors.pink,
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => PreferenceScreen()));

              if (result is Preference) {
                setState(() {
                  preference = result;
                });
              }
            },
            icon: const Icon(Icons.search, size: 30),
            color: AppColors.darkGrey,
          ),
        ],
      ),
      body: globalUser == null
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.pink,
              ),
            )
          : getPages()[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: AppStyles.text.copyWith(
          fontSize: 12,
        ),
        selectedItemColor: AppColors.pink,
        unselectedItemColor: AppColors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            tooltip: 'Home',
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message_rounded),
            tooltip: 'Messages',
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            tooltip: 'Account',
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
