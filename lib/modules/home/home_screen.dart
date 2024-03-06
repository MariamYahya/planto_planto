import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String content = "";
  List<String> allLines = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    if (content.isEmpty) readFiles();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundtest.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    "${allLines[index]}",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  );
                },
                itemCount: allLines.length,
              ),
            ),
          ),
        ),
      ),
    );
  }

  readFiles() async {
    String text = await rootBundle.loadString("assets/wheat.txt");
    content = text;
    setState(() {
      allLines = content.split("\n");
    });
  }
}
