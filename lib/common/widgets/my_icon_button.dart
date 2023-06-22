import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize, minWidth;
  final Color? iconColor, background;
  final VoidCallback? onPressed;
  final BoxBorder? border;

  const MyIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.minWidth,
    this.iconColor,
    this.onPressed,
    this.background,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onPressed,
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 22,
        constraints: BoxConstraints(
          minWidth: minWidth ?? 45,
          minHeight: minWidth ?? 45,
        ),
        icon: Icon(
          icon,
          color: iconColor ?? Theme.of(context).appBarTheme.iconTheme!.color,
        ),
      ),
    );
  }
}
