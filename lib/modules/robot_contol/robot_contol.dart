import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:planto_planto/modules/robot_contol/widgets/control_buttons.dart';

class RobotControlView extends StatelessWidget {
  const RobotControlView({super.key});

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundtest.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height * 0.5,
                  color: Colors.white,
                ),
                SizedBox(height: 100,),
                ControlButtonDesign(icon: Icons.keyboard_arrow_up_rounded),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ControlButtonDesign(icon: Icons.keyboard_arrow_left_rounded),
                    SizedBox(width: 100,),
                    ControlButtonDesign(icon: Icons.keyboard_arrow_right_rounded),
                  ],
                ),
                SizedBox(height: 10,),
                ControlButtonDesign(icon: Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
