import 'dart:async';

import 'package:ecommercefirebase/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => SignInPage())));
    });
    return Scaffold(
      body: Center(
        child: Image.asset("assets/icon/Splash.png"),
      ),
    );
  }
}
