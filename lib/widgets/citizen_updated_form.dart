import 'dart:convert';

import 'package:e_palika/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CitizenUpdated extends StatefulWidget {
  const CitizenUpdated({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CitizenUpdatedState createState() => _CitizenUpdatedState();
}

class _CitizenUpdatedState extends State<CitizenUpdated> {
  String gender = 'Male';

  final TextEditingController _uName = TextEditingController();
  final TextEditingController _birthPlace = TextEditingController();
  final TextEditingController _permAddress = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  Future<void> insertRecord() async {
    // print("Pressed");
    if (_uName.text != "" ||
        _birthPlace.text != "" ||
        _permAddress.text != "" ||
        _dateOfBirth.text != "") {
      // print("IF");
      try {
        String uri =
            "http://192.168.1.68/e-palika_backend/citizenship/insert_record.php";

        var res = await http.post(Uri.parse(uri), body: {
          "fname": _uName.text,
          "birthPlace": _birthPlace.text,
          "gender": gender,
          "permAddress": _permAddress.text,
          "dob": _dateOfBirth.text,
        });

        var response = jsonDecode(res.body);

        if (response["Success"] == "true") {
          _uName.text = "";
          _birthPlace.text = "";
          _permAddress.text = "";
          _dateOfBirth.text = "";
          SnackBar(
            content: Text(
              "Data Inserted Successfully",
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: Colors.green,
          );
        } else {
          SnackBar(
            content: Text(
              'Error',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: Colors.red,
          );
        }
      } catch (e) {
        SnackBar(
          content: Text(
            'Error',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
      }
    } else {
      SnackBar(
        content: Text(
          'Please Fill All The Fields.',
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      // print("Please fill all field");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D4059),
      body: GridView(
        // scrollDirection: Axis.vertical,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          TextFormField(
            controller: _uName,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Full Name",
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextFormField(
            controller: _birthPlace,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Birth Place",
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //====================Sex=========================
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text('Sex',
                  style:
                      GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                    activeColor: const Color(0xFFEA5455),
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                Text(
                  'Male',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
                Radio(
                    activeColor: const Color(0xFFEA5455),
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                Text(
                  'Female',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
                Radio(
                    activeColor: const Color(0xFFEA5455),
                    value: 'Others',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    }),
                Text(
                  'Others',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: _permAddress,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Permanent Address",
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextFormField(
            controller: _dateOfBirth,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Date of Birth",
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // =======>> Button to Store Data <<========

          Buttons(
            buttonText: 'Upload',
            buttonColor: const Color(0xFFFFD460),
            onClick: insertRecord,
          ),

          // =======>> Button to Store Data <<========
        ],
      ),
    );
  }
}
