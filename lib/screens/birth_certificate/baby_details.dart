import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BabyDetails extends StatefulWidget {
  const BabyDetails({Key? key}) : super(key: key);

  @override
  _BabyDetailsState createState() => _BabyDetailsState();
}

class _BabyDetailsState extends State<BabyDetails> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _birthPlace = TextEditingController();
  final TextEditingController _permanentAddress = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Fill Details',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              //==========Full Name================
              TextFormField(
                controller: _userName,
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

              //===========Birth Place================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
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
              ),

              //====================Sex=========================
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text('Sex',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white)),
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
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
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
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
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
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),

              //===========Permanent Address================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: _permanentAddress,
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
              ),

              //===========Date of Birth================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
