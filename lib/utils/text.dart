// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  final String text;
  final double font;
  final Color color;
  const modified_text(
      {super.key, required this.text, required this.font, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(fontSize: font, color: color));
  }
}

class bold_text extends StatelessWidget {
  final String text;
  final double font;
  final Color color;
  const bold_text(
      {super.key, required this.text, required this.font, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(fontSize: font, color: color,fontWeight: FontWeight.bold));
  }
}
