import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CitizenUpdated extends StatefulWidget {
  const CitizenUpdated({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CitizenUpdatedState createState() => _CitizenUpdatedState();
}

class _CitizenUpdatedState extends State<CitizenUpdated> {
  String gender = 'Male';

  final TextEditingController _uName = TextEditingController();
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
            controller: _uName,
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
            controller: _uName,
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
            controller: _uName,
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
        ],
      ),
    );
  }
}
