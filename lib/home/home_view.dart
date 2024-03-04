import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:planto_planto/login/login_view.dart';
import 'package:planto_planto/registration/registeration.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/backgroundtest.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100),
            Container(
              child: Image.asset("assets/images/home-logo-test.png"),
              width: 70,
              height: 75,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 50),
            Text(
              "A step \ntowards less \npollution.",
              style: theme.textTheme.displayLarge,
            ),
            const SizedBox(height: 150),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                  child: Text(
                    "Login",
                    style: theme.textTheme.titleSmall
                  ),
                  color: Colors.white24,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegistrationView.routName);
                },
                child: Text(
                  "Create an Account",
                  style: theme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
