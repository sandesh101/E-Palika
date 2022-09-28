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
                  'About Citizenship',
                  style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
                ),
              ),
              const Divider(
                indent: 8,
                endIndent: 230,
                color: Color(0xFFFFD460),
                thickness: 3.0,
              ),
              Text(
                '1. One should be atleast 16 years old.',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),

              // =======================Types========================
              Text(
                '2. Types:',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '2.1. Citizenship by descent',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '2.2. Naturalized Citizenship',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '2.3. Non-resident Nepalese Citizenship',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '2.4. Honorary Citizenship',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),

              // =======================Required Documents Starts========================
              Text(
                '3. Required Documents:',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '3.1. Birth Certificate',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '3.2. Citizenship of Mother or Father or Both',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '3.3. Academic Certificate',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '3.4. Recommendation from Ward Office',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
              // =======================Required Document Ends========================
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
                  Navigator.pushNamed(context, 'citizenship_form'),
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
