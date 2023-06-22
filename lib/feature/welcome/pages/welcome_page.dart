import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/routes/routes.dart';
import 'package:whatsapp_flutter/constants/assets.dart';

import '../../../common/widgets/my_elevated_button.dart';
import '../widgets/lang_drop_down.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                child: Image.asset(
                  Assets.assetsImagesCircle,
                  color: context.theme.circleImageColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Welcome to WhatsApp",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        height: 1.5,
                        color: context.theme.greyColor,
                      ),
                      text: 'Read our ',
                      children: [
                        TextSpan(
                          text: 'Privacy Policy. ',
                          style: TextStyle(color: context.theme.blueColor),
                        ),
                        const TextSpan(
                          text: 'Tap "Agree and Continue" to acctept the ',
                        ),
                        TextSpan(
                          text: 'Terms of Service.',
                          style: TextStyle(color: context.theme.blueColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MyElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.login,
                      (route) => false,
                    );
                  },
                  text: 'AGREE AND CONTINUE',
                ),
                const SizedBox(height: 20),
                const LangDropdown(),
                // langDropdown(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
