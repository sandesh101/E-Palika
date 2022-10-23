import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_palika/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late final String activeUser = FirebaseAuth.instance.currentUser!.uid;
  String cuid = FirebaseAuth.instance.currentUser!.uid.toString();
  var stream = FirebaseFirestore.instance.collection('Citizenship');
  // var subColStream = stream.doc('').collection("ICitizenData");

  // .doc('sOb43UzXZwbgPPUhuA4eGDarOo32') //yv0VfaN9ySXzyX8edmHlcbVUZfw1
  // .collection('ICitizenData');

  // final did = FirebaseFirestore.instance.doc('').id;
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
            stream: stream.where('id', isEqualTo: cuid).snapshots(),
            // stream: stream.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return const TextButton(
                          onPressed: retriveData, child: Text('Retrives'));
                      // return ListTile(
                      //   title: Text(snapshot.data?.docs[index]['name']),
                      // );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}

void retriveData() {
  FirebaseFirestore.instance.collection('Citizenship').get().then((value) {
    print(value);
    value.docs.forEach((element) {
      FirebaseFirestore.instance
          .collection('Citizenship')
          .doc(element.id)
          .collection('ICitizenData')
          .get()
          .then((subcol) {
        subcol.docs.forEach((item) {
          print(item.data());
          // print(cuid);
        });
      });
    });
  });
}

// void retriveDatas() {
//   FirebaseFirestore.instance
//       .collection('Citizenship')
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) {
//       FirebaseFirestore.instance
//           .doc(doc.id)
//           .collection("ICitizenData")
//           .get()
//           .then((subcol) {
//         subcol.docs.forEach((item) {
//           print(item.data());
//         });
//       });
//     });
//   });
// }
