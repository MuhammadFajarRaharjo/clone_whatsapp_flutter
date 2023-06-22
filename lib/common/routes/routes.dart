import 'package:flutter/material.dart';
import 'package:whatsapp_flutter/common/models/user_model.dart';
import 'package:whatsapp_flutter/common/utils/error_page.dart';
import 'package:whatsapp_flutter/feature/auth/pages/login_page.dart';
import 'package:whatsapp_flutter/feature/auth/pages/profile_info_page.dart';
import 'package:whatsapp_flutter/feature/auth/pages/verification_page.dart';
import 'package:whatsapp_flutter/feature/chat/page/chat_page.dart';
import 'package:whatsapp_flutter/feature/contact/page/contact_page.dart';
import 'package:whatsapp_flutter/feature/home/page/home_page.dart';
import 'package:whatsapp_flutter/feature/welcome/pages/welcome_page.dart';
import '../../feature/auth/pages/image_picker_page.dart';
import '../../feature/chat/page/profile_page.dart';

class Routes {
  static const String imagePicker = 'image-picker';

  // welcome page
  static const String welcome = 'welcome';

  // auth page
  static const String login = 'login';
  static const String profileInfo = 'profile-info';
  static const String verify = 'verify';

  // home page
  static const String home = 'home';
  static const String contact = 'contact';

  // chat page
  static const String chat = 'chat';
  static const String profile = 'profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) => const WelcomePage());

      // auth page
      case login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case profileInfo:
        return MaterialPageRoute(builder: (context) => const ProfileInfoPage());
      case verify:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
            phoneNumber: args['phoneNumber'],
            verificationId: args['verificationId'],
          ),
        );

      case imagePicker:
        return MaterialPageRoute(builder: (context) => const ImagePickerPage());

      // home page
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case contact:
        return MaterialPageRoute(builder: (context) => const ContactPage());

      // chat page
      case chat:
        final UserModel user = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (context) => ChatPage(user));
      case profile:
        final UserModel user = settings.arguments as UserModel;
        return MaterialPageRoute(builder: (context) => ProfilePage(user));

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: ErrorPage(message: "No page route provided"),
          ),
        );
    }
  }
}
