import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String firebaseProjectURL = '';
  // static String? graphqlURL = dotenv.get("APP_ENDPOINT");

  static const Color wayhaPrimaryColor = Color(0xFF8AE9C9);
  static const Color success = Color(0xFF19EE6E);
  static const Color wayhaSecondaryColor = Color(0xFF59CDDC);
  static const Color wayhaMainTxtColor = Color(0xFF2D2121);
  static const Color wayhaChildBgColor = Color(0xFFF4F5F5);
  static const Color wayhafontBtnColor = Color(0xFF2D2121);
  static const Color onePayColor = Color(0xFFe84848);
  static const double wayhaHeading1 = 30;
  static const double wayhaHeading12 = 25;
  static const double wayhaHeading2 = 20;
  static const double wayhaHeading21 = 18;
  static const double wayhaHeading3 = 16;
  static const double wayhaHeading4 = 12;
  static const double wayhaSubtitle = 10;
  static const double wayhaTextSize = 14;
  static const double wayhaBtnTxtSize = 20;

  static const MaterialColor wayhaColor = const MaterialColor(
    0xFF8AE9C9,
    const <int, Color>{
      50: const Color(0xFFe0e0e0),
      100: const Color(0xFFb3b3b3),
      200: const Color(0xFF808080),
      300: const Color(0xFF4d4d4d),
      400: const Color(0xFF262626),
      500: const Color(0xFF8AE9C9),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}
