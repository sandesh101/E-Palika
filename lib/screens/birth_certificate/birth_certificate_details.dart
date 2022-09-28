import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';

class BirthCertificateDetails extends StatelessWidget {
  const BirthCertificateDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D4059),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/eplogo.png',
                height: 100,
                width: 100,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'About Birth Certificate',
                  style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
                ),
              ),
              const Divider(
                indent: 8,
                endIndent: 300,
                color: Color(0xFFFFD460),
                thickness: 3.0,
              ),
              Text(
                '1. Upto 35 days, the registration is free.',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),

              // ===============================================
              Text(
                '2. After 35 days, one have to pay Rs. 8 for registration.',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),

              // ===============================================
              Text(
                '3. You have to bring proof of your citizenship.',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Buttons(
                buttonColor: const Color(0xFFFFD460),
                buttonText: 'Continue',
                onClick: () => {
                  Navigator.pushNamed(context, 'birthregistration_form'),
                },
              ),
              Buttons(
                buttonColor: const Color(0xFFEA5455),
                buttonText: 'Cancel',
                onClick: () => {
                  Navigator.pushNamed(context, '/'),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
