import 'package:e_palika/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBirthData extends StatefulWidget {
  const ShowBirthData({Key? key}) : super(key: key);

  @override
  _ShowBirthDataState createState() => _ShowBirthDataState();
}

class _ShowBirthDataState extends State<ShowBirthData> {
  final auth = FirebaseAuth.instance;
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  final fetchRef = FirebaseDatabase.instance
      .ref('BirthCertificate')
      .child(FirebaseAuth.instance.currentUser!.uid);
  // .child('Certificate');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'login');
            },
            icon: (const Icon(Icons.logout)),
          ),
        ],
        title: const Text('Birth Certificate List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: fetchRef,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.child('name').value.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            fetchRef.remove();
                          },
                          icon: const Icon(Icons.delete),
                          color: AppColors.accentColor,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
