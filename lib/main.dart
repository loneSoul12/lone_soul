import 'package:flutter/material.dart';
import 'package:lone_soul/app_colors.dart';
import 'package:lone_soul/screens/auth_start_screen.dart';
import 'package:lone_soul/screens/email_screen.dart';
import 'package:lone_soul/screens/password_screen.dart';
import 'package:lone_soul/screens/signin_screen.dart';
import 'package:lone_soul/screens/stepper_screens/main_stepper.dart';
import 'package:lone_soul/state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kbduhbutbqorrmbesabf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtiZHVoYnV0YnFvcnJtYmVzYWJmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYzODQ4ODQsImV4cCI6MjAwMTk2MDg4NH0.f3gnYl62dtbYgU-cNQrdLuCxIPb6RHJMHYzq2qcJ_Po',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: AppColors.brown,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.brown),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: AuthStateManager(),
    );
  }
}
