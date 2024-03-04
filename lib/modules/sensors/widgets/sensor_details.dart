import 'package:flutter/material.dart';

class SensorDetailsView extends StatelessWidget {

  final String sensorName;
  final double sensorReading;
  final double sensorHistory;

  const SensorDetailsView({
    super.key,
    required this.sensorName,
    required this.sensorReading,
    required this.sensorHistory,
  });


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            sensorName,
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20),
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
            "$sensorReading",
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20),
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
            "$sensorHistory",
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
