import 'package:e_palika/constants/colors.dart';
// import 'package:e_palika/screens/login_screen.dart';
import 'package:e_palika/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              height: 150,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Welcome ${FirebaseAuth.instance.currentUser?.email}',
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: AppColors.accentColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Our Services',
                  style: GoogleFonts.poppins(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Buttons(
                  buttonColor: AppColors.secondaryColor,
                  buttonText: 'Citizenship',
                  onClick: () => {
                    Navigator.pushNamed(context, 'citizenship_details'),
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Buttons(
                  buttonColor: AppColors.secondaryColor,
                  buttonText: 'Birth Certificate',
                  onClick: () => {
                    Navigator.pushNamed(context, 'birthcertificate_details'),
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    // FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, 'showBirthList');
                  },
                  child: Text(
                    'Show List',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ],
            )
            // const SizedBox(
            //   height: 30,
            // ),
            // Buttons(
            //     buttonText: 'Go to Login',
            //     buttonColor: AppColors.secondaryColor,
            //     onClick: () => {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => const LoginScreen(),
            //             ),
            //           )
            //         })
          ],
        ),
      ),
    );
  }
}
