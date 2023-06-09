import 'package:flutter/material.dart';

class AppColors {
  static const pink = Color(0xffFE3675);
  static const brown = Color(0xffFF7854);
  static const darkGrey = Color(0xff4A4A4A);
  static const grey = Color(0xff939393);
  static const gradient = LinearGradient(
      colors: [brown, pink],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.0, 1.0),
      tileMode: TileMode.clamp);
}
