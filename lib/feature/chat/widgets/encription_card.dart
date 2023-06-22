import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

class EncriptionCard extends StatelessWidget {
  const EncriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ).copyWith(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.theme.bgColorChatEncription,
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: context.theme.textColorChatEncription,
        ),
        "Pesan dan panggilan ini terenkripsi secata end-to-end. Tidak seorang pun di luar chat ini, termasuk Whatsapp, yang dapat memvaca atau mendengakrannya. Ketuk untukl informasi selengkapnya",
      ),
    );
  }
}
