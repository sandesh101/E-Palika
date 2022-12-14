import 'package:e_palika/widgets/show_birth_data.dart';
import 'package:e_palika/widgets/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../citizenship/upload_photo.dart';

class BirthRegistrationForm extends StatefulWidget {
  const BirthRegistrationForm({Key? key}) : super(key: key);

  @override
  _BirthRegistrationFormState createState() => _BirthRegistrationFormState();
}

class _BirthRegistrationFormState extends State<BirthRegistrationForm> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _weightAtBirth = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _districtName = TextEditingController();
  final TextEditingController _wardNumber = TextEditingController();
  final TextEditingController _municipalityAddress = TextEditingController();

  String gender = 'Male';

  final databseRef = FirebaseDatabase.instance.ref('BirthCertificate');
  final auth = FirebaseAuth.instance;

  void insertRecord() {
    final uid = auth.currentUser!.uid;
    final childId = DateTime.now().millisecondsSinceEpoch;
    databseRef.child(uid).child(childId.toString()).set({
      'id': uid,
      'name': _userName.text,
      'weight': _weightAtBirth.text,
      'dob': _dateOfBirth.text,
      'gender': gender,
      'district': _districtName.text,
      'wardnumber': _wardNumber.text,
      'municipality': _municipalityAddress.text,
    }).then((value) {
      ToastMessage().successMessage('Successfully Uploaded');
      Navigator.pushNamed(context, 'showBirthList');
    }).onError((error, stackTrace) {
      ToastMessage().errorMessage(error.toString());
    });
  }

  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Details'),
          // content: const BabyDetails(),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'New Born Baby Details',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
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

                    //===========Date of birth================
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
                        ],
                      ),
                    ),

                    //===========Weight at birth================
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: _weightAtBirth,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Weight at Birth",
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
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Address'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Birth Address Details',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
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
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Upload Photo'),
          content: const PickImage(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                // print("Completed");
                insertRecord();
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
      ),
    );
  }
}
