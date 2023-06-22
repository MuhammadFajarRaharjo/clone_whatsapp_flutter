import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback onPressed;

  const MyElevatedButton({
    super.key,
    required this.text,
    this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: width ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
