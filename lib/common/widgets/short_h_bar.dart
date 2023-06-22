import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

class ShortHBar extends StatelessWidget {
  final double? height, width;
  final Color? color;
  const ShortHBar({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 4,
      width: width ?? 25,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: color ?? context.theme.greyColor!.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
