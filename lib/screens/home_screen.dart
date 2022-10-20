import 'package:e_palika/constants/colors.dart';
import 'package:e_palika/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D4059),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/eplogo.png',
              height: 200,
              width: 200,
            ),
            Text(
              'Our Services',
              style: GoogleFonts.poppins(fontSize: 50, color: Colors.white),
            ),
            const SizedBox(
              height: 70,
            ),
            Buttons(
              buttonColor: AppColors.secondaryColor,
              buttonText: 'Citizenship',
              onClick: () => {
                Navigator.pushNamed(context, 'citizenship_details'),
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Buttons(
              buttonColor: AppColors.secondaryColor,
              buttonText: 'Birth Certificate',
              onClick: () => {
                Navigator.pushNamed(context, 'birthcertificate_details'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
