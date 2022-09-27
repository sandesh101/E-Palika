import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D4059),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/eplogo.png',
            height: 200,
            width: 200,
          ),
          Text(
            'Our Services',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFFD460),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Citizenship',
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                ),
              )),
        ],
      ),
    );
  }
}
