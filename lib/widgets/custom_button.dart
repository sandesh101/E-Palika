import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final String destText;
  final Color buttonColor;

  const Buttons(
      {Key? key,
      required this.buttonText,
      required this.destText,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        maximumSize: const Size(240, 150),
      ),
      onPressed: () {
        Navigator.pushNamed(context, destText);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
