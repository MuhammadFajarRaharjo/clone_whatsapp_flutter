import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

import '../../../common/utils/pallets.dart';
import '../../../common/widgets/my_icon_button.dart';
import '../../../common/widgets/short_h_bar.dart';

showModalBottom(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                MyIconButton(
                  icon: Icons.close,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 10),
                const Text(
                  "App Language",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: context.theme.greyColor?.withOpacity(0.3),
              thickness: 1,
            ),
            RadioListTile(
              value: true,
              groupValue: true,
              onChanged: (value) {},
              activeColor: Pallets.green,
              title: const Text('English'),
              subtitle: Text(
                "Phone's Language",
                style: TextStyle(color: context.theme.greyColor),
              ),
            ),
            RadioListTile(
              value: true,
              groupValue: false,
              onChanged: (value) {},
              activeColor: Pallets.green,
              title: const Text('Indonesia'),
              subtitle: Text(
                "Indonesia",
                style: TextStyle(color: context.theme.greyColor),
              ),
            ),
          ],
        ),
      );
    },
  );
}
