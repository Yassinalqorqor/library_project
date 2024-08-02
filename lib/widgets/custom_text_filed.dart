import 'package:flutter/material.dart';

class coustumtextfield extends StatelessWidget {
  const coustumtextfield(
      {super.key,
        required this.icon,
        required this.controller,
        required this.label,
        required this.obscureText});
  final String label;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
      ),
      obscureText: obscureText,
    );
  }
}
