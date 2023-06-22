import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_flutter/common/extension/custom_theme_exttension.dart';
import 'package:whatsapp_flutter/common/helpers/show_alert_dialog.dart';
import 'package:whatsapp_flutter/common/utils/pallets.dart';
import 'package:whatsapp_flutter/common/widgets/my_elevated_button.dart';
import 'package:whatsapp_flutter/feature/auth/widgets/my_underline_text_field.dart';

import '../../../common/widgets/my_icon_button.dart';
import '../controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController countryNameController,
      countryCodeController,
      phoneNumberController;

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ID'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: Icon(Icons.language, color: Pallets.green),
          hintText: 'Search country code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Pallets.green),
          ),
        ),
      ),
      onSelect: (country) {
        countryCodeController.text = country.phoneCode;
        countryNameController.text = country.displayNameNoCountryCode;
      },
    );
  }

  sendCodeToPhone() {
    if (phoneNumberController.text.isEmpty) {
      return showAlertDialog(
        context: context,
        message: 'Please input your phone number',
        onPressed: () => Navigator.of(context).pop(),
      );
    }
    if (phoneNumberController.text.length < 9) {
      return showAlertDialog(
        context: context,
        message:
            "The phone number you entered is to short for the country: ${countryNameController.text}.\n\nInclude your area code if you haven't",
        onPressed: () => Navigator.of(context).pop(),
      );
    }
    if (phoneNumberController.text.length > 15) {
      return showAlertDialog(
        context: context,
        message:
            "The phone number you entered is to long for the country: ${countryNameController.text}.\n\nInclude your area code if you haven't",
        onPressed: () => Navigator.of(context).pop(),
      );
    }
    ref.read(authControllerProvider).signInWithPhoneNumber(
          context,
          '+${countryCodeController.text}${phoneNumberController.text}',
        );
  }

  @override
  void initState() {
    super.initState();
    countryCodeController = TextEditingController(text: "62");
    countryNameController = TextEditingController(text: "Indonesia");
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    countryNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Enter your phone number",
          style: TextStyle(color: context.theme.authTitleAppBarColor),
        ),
        actions: [MyIconButton(onPressed: () {}, icon: Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'WhatsApp will need to verify your number phone. ',
                  style: TextStyle(color: context.theme.greyColor, height: 1.5),
                  children: [
                    TextSpan(
                      text: "What's my number?",
                      style: TextStyle(color: context.theme.blueColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MyUnderlineTextField(
                onTap: showCountryCodePicker,
                controller: countryNameController,
                readOnly: true,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Pallets.darkGreen,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: MyUnderlineTextField(
                      onTap: showCountryCodePicker,
                      controller: countryCodeController,
                      prefixText: '+',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyUnderlineTextField(
                      hintText: 'Phone Number',
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Carrier changes my apply",
              style: TextStyle(color: context.theme.greyColor),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyElevatedButton(
        text: 'NEXT',
        onPressed: sendCodeToPhone,
        width: 70,
      ),
    );
  }
}
