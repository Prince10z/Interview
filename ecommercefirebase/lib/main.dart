import 'package:ecommercefirebase/features/Splash.dart';
import 'package:ecommercefirebase/features/auth/Signup_screen.dart';
import 'package:ecommercefirebase/features/auth/login_screen.dart';
import 'package:ecommercefirebase/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
