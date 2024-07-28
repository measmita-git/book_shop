import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dt_colors.dart';

class AppTextStyles {
  static final TextStyle muliLargeTextStyle = GoogleFonts.mulish(
    textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  static final TextStyle muliTextStyle = GoogleFonts.mulish(
    textStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.labelGreyText,
    ),
  );

  static final TextStyle muliPrimaryTextStyle = GoogleFonts.mulish(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Color(0xff0E539A),
    ),
  );

  static final TextStyle muliSmallTextStyle = GoogleFonts.mulish(
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static final TextStyle robotoTextStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static final TextStyle robotoLargeTextStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xff312F3C),
    ),
  );


}