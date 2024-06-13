import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle myStyle({
  required int fontSize,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return GoogleFonts.aBeeZee(
    fontSize: fontSize.toDouble(),
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}
