import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';

import '../../../common/utils/pallets.dart';
import '../helpers/show_modal_bottom.dart';

class LangDropdown extends StatelessWidget {
  const LangDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showModalBottom(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langBtnHiglightColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language, color: Pallets.green),
              const SizedBox(width: 10),
              const Text("English"),
              const SizedBox(width: 10),
              Icon(
                Icons.keyboard_arrow_down,
                color: Pallets.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
