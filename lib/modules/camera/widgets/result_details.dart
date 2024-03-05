import 'package:flutter/material.dart';

class ResultDetails extends StatelessWidget {
  const ResultDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Result: ",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Kind: ",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}