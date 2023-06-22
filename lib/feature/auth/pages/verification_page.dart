import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/widgets/my_icon_button.dart';
import 'package:whatsapp_flutter/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_flutter/feature/auth/widgets/my_underline_text_field.dart';

class VerificationPage extends ConsumerWidget {
  final String phoneNumber, verificationId;
  const VerificationPage({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  verifyCodeSms(BuildContext context, String smsCode, WidgetRef ref) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          verificationId: verificationId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Verify your number',
          style: TextStyle(color: context.theme.authTitleAppBarColor),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [MyIconButton(icon: Icons.more_vert, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: context.theme.greyColor, height: 1.5),
                  children: [
                    const TextSpan(
                      text:
                          "you've tired to registered +6208123456789. before requesting an SMS or call with youre code.\n",
                    ),
                    TextSpan(
                      text: 'Wrong number?',
                      style: TextStyle(color: context.theme.blueColor),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: MyUnderlineTextField(
                hintText: '- - -  - - -',
                fontSize: 30,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  if (text.length == 6) {
                    verifyCodeSms(context, text, ref);
                  }
                },
              ),
            ),
            Text(
              "Enter 6 digit number",
              style: TextStyle(color: context.theme.greyColor),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              iconColor: context.theme.greyColor,
              title: Text(
                'Resend SMS',
                style: TextStyle(color: context.theme.greyColor),
              ),
              dense: true,
              // shape: Border(
              //   bottom: BorderSide(
              //     color: context.theme.blueColor!.withOpacity(0.4),
              //   ),
              // ),
            ),
            Divider(color: context.theme.blueColor!.withOpacity(0.2)),
            ListTile(
              leading: const Icon(Icons.phone),
              iconColor: context.theme.greyColor,
              title: Text(
                'Call Me',
                style: TextStyle(color: context.theme.greyColor),
              ),
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}
