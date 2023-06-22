import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

import '../../../common/utils/pallets.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    super.key,
    required this.showDate,
  });

  final String showDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.theme.chatTextFieldColor,
      ),
      child: Text(
        showDate,
        style: TextStyle(
          fontSize: 12,
          color: Pallets.darkGrey,
        ),
      ),
    );
  }
}
