import 'package:flutter/material.dart';

class ControlButtonDesign extends StatelessWidget {
  const ControlButtonDesign({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.white),
        child: Icon(
         icon,
          color: Color(0xFF093923),
          size: 40,
        ),
      ),
    );
  }
}
