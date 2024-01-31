import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab2/screens/clothes_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return const ClothesList();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 120),
      color: Colors.purple[100],
      child: const Text(
        "Todo app",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 30,
            decoration: TextDecoration.none,
          fontFamily: "Roboto"
        ),
      ),
    );
  }
}
