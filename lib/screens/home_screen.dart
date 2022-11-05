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
      appBar: AppBar(
        title: Text(
          "E-Palika",
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
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
                  height: 30,
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
      child: Column(
        children: [
          Text(
            'Hey ${FirebaseAuth.instance.currentUser?.email}',
            style:
                GoogleFonts.poppins(fontSize: 20, color: AppColors.accentColor),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.arrow_right,
            size: 40,
            color: Colors.black,
          ),
          title: Text(
            'Show Citizenship List',
            style:
                GoogleFonts.poppins(color: AppColors.accentColor, fontSize: 18),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, 'showList');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.arrow_right,
            size: 40,
            color: Colors.black,
          ),
          title: Text(
            'Show Birth List',
            style:
                GoogleFonts.poppins(color: AppColors.accentColor, fontSize: 18),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, 'showBirthList');
          },
        ),
      ],
    );
  }
}
