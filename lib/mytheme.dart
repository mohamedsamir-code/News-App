import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0xff39A552);
  static Color redColor = Color(0xffC91C22);
  static Color blueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color babyblueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryLightColor,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryLightColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
              )
          )
      )

  );
}