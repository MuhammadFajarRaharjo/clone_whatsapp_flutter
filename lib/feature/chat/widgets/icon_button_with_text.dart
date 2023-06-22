import 'package:flutter/material.dart';

import '../../../common/utils/pallets.dart';

class IconButtonWithText extends StatelessWidget {
  const IconButtonWithText({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Pallets.darkGreen, size: 30),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: Pallets.darkGreen),
            ),
          ],
        ),
      ),
    );
  }
}
