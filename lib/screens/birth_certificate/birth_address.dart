import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthAddress extends StatefulWidget {
  const BirthAddress({Key? key}) : super(key: key);

  @override
  _BirthAddressState createState() => _BirthAddressState();
}

class _BirthAddressState extends State<BirthAddress> {
  final TextEditingController _districtName = TextEditingController();
  final TextEditingController _municipalityAddress = TextEditingController();
  final TextEditingController _wardNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Birth Address Details',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              //==========District================
              TextFormField(
                controller: _districtName,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "District",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //===========Address================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: _municipalityAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Municipality",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              //===========Ward Number================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: _wardNumber,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Ward Number",
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
