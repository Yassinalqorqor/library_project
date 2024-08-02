import 'package:flutter/material.dart';

class coustumtextbuttonfield extends StatelessWidget {
  const coustumtextbuttonfield({
    super.key,
    required this.label,
    required this.icon,
    this.style,
    this.onpressed,
  });

  final Widget label;
  final Widget icon;
  final ButtonStyle? style;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        onpressed;
      },
      icon: icon,
      label: label,
      style: style,
    );
  }
}
