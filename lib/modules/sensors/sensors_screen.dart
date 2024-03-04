import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:planto_planto/modules/sensors/widgets/sensor_details.dart';

class SensorsScreen extends StatelessWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/backgroundtest.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.8), BlendMode.dstATop)),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset("assets/images/login-logo-test.png"),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Sensor",
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: 2.2,
                      height: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Sensor reading",
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: 2.2,
                      height: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "History",
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2.2,
                  endIndent: 8,
                  indent: 8,
                ),
                SensorDetailsView(
                  sensorName: "Temperature",
                  sensorReading: 30,
                  sensorHistory: 40,
                ),
                SensorDetailsView(
                  sensorName: "Humidity",
                  sensorReading: 20,
                  sensorHistory: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
