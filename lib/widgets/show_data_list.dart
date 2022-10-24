import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_palika/constants/colors.dart';

class ShowDataList extends StatefulWidget {
  // String childId;
  const ShowDataList({Key? key}) : super(key: key);

  @override
  _ShowDataListState createState() => _ShowDataListState();
}

class _ShowDataListState extends State<ShowDataList> {
  final auth = FirebaseAuth.instance;
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  final fetchRef = FirebaseDatabase.instance
      .ref('Citizenship')
      .child(FirebaseAuth.instance.currentUser!.uid);

  // String get childId => childId;
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
        title: const Text('Citizenship List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: fetchRef,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.secondaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.child('name').value.toString(),
                                style: GoogleFonts.poppins(fontSize: 20),
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
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
