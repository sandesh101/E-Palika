import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_palika/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDataList extends StatefulWidget {
  const ShowDataList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowDataListState createState() => _ShowDataListState();
}

class _ShowDataListState extends State<ShowDataList> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final activeUser = FirebaseAuth.instance;
  // final fetchRef = FirebaseFirestore.instance.collection('Citizenship').where('uid', isEqualTo: activeUser.currentUser!.uid).snapshots();

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
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Citizenship')
                .where('id', isEqualTo: activeUser.currentUser?.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.docs!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(snapshot.data.docs[index]['name'].toString()),
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
