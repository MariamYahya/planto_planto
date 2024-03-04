import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool filled;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obSecure;
  final bool autoCorrect;
  final bool suggestion;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.filled,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.obSecure,
    required this.controller,
    this.validator,
    required this.autoCorrect,
    required this.suggestion,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: filled,
        fillColor: Color(0xFF093923),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.white,
      ),
      obscureText: obSecure,
      controller: controller,
      validator: validator,
      autocorrect: autoCorrect,
      enableSuggestions: suggestion,
    );
  }
}
