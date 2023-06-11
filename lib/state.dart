import 'package:flutter/material.dart';
import 'package:lone_soul/screens/auth_start_screen.dart';
import 'package:lone_soul/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateManager extends StatelessWidget {
  const AuthStateManager({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const AuthStartScreen();
          }
        });
  }
}
