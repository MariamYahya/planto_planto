import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planto_planto/home/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "splash";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundtest.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            "assets/images/splash-logo-test.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
