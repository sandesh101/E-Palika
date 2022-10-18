// import 'package:e_palika/widgets/custom_button.dart';
import 'package:e_palika/screens/citizenship/upload_photo.dart';
// import 'package:e_palika/widgets/citizenship_parent_details.dart';
// import 'package:e_palika/widgets/citizenship_user_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CitizenshipForm extends StatefulWidget {
  const CitizenshipForm({Key? key}) : super(key: key);

  @override
  State<CitizenshipForm> createState() => _CitizenshipFormState();
}

class _CitizenshipFormState extends State<CitizenshipForm> {
  // ==> Code to upload data to database <==

  Future<void> insertRecord() async {
    // if (CitizenUserDetails) {}
    // print("");
  }

  // ==> Code to upload data to database <==

  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Applicant'),
          content: const CitizenUserDetails(),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Parents'),
            content: const CitizenParentDetails()),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Upload Photo'),
          content: const PickImage(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D4059),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Color(0xFFEA5455)),
        ),
        child: Stepper(
          elevation: 0.0,
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;

            if (isLastStep) {
              //Server Code to send data to database
              insertRecord();
              // print("Completed");
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            currentStep == 0
                ? Navigator.of(context).pushNamed('home')
                : setState(() {
                    currentStep -= 1;
                  });
          },

          //====================Adding Custom Button==============================
        ),
      ),
    );
  }
}

//================================Citizenchip User Details=============================================

class CitizenUserDetails extends StatefulWidget {
  const CitizenUserDetails({Key? key}) : super(key: key);

  @override
  _CitizenUserDetailsState createState() => _CitizenUserDetailsState();
}

class _CitizenUserDetailsState extends State<CitizenUserDetails> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController birthPlace = TextEditingController();
  final TextEditingController permanentAddress = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();

  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Fill Details of Applicant',
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
                controller: userName,
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
                  controller: birthPlace,
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
                  controller: permanentAddress,
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
                  controller: dateOfBirth,
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
//================================Citizenchip User Details=============================================

//===============================Parents Details======================================================
class CitizenParentDetails extends StatefulWidget {
  const CitizenParentDetails({Key? key}) : super(key: key);

  @override
  _CitizenParentDetailsState createState() => _CitizenParentDetailsState();
}

class _CitizenParentDetailsState extends State<CitizenParentDetails> {
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController fatherAddress = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController motherAddress = TextEditingController();

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
              //==========Father Name================
              TextFormField(
                controller: fatherName,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Father Name",
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
                  controller: fatherAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Address",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              //===========Mother Name================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: motherName,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Mother Name",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              //===========Address================
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: motherAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Address",
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

//===============================Parents Details======================================================
