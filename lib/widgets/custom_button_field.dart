import 'package:flutter/material.dart';

class coustombuttonfield extends StatelessWidget {
  const coustombuttonfield({super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.style});

  final Widget icon;
  final String label;
  final ButtonStyle? style;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Text(label),
      style: style,
      //onPressed: () {  },
      onPressed:onPressed,

    );
  }
}
