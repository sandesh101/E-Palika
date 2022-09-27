import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String buttonText;

  const Buttons({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFFD460),
        maximumSize: const Size(240, 150),
      ),
      onPressed: () {},
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
