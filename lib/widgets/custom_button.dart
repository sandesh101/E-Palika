import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onClick;

  const Buttons({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        maximumSize: const Size(240, 150),
      ),
      onPressed: onClick,
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
