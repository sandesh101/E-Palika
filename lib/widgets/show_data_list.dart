import 'package:e_palika/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDataList extends StatefulWidget {
  const ShowDataList({Key? key}) : super(key: key);

  @override
  _ShowDataListState createState() => _ShowDataListState();
}

class _ShowDataListState extends State<ShowDataList> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Your Submission',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, 'login');
              },
              icon: const Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}
