// import 'package:e_palika/widgets/show_birth_data.dart';
import 'package:e_palika/widgets/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../citizenship/upload_photo.dart';

class CitizenshipForm extends StatefulWidget {
  const CitizenshipForm({Key? key}) : super(key: key);

  @override
  _CitizenshipFormState createState() => _CitizenshipFormState();
}

class _CitizenshipFormState extends State<CitizenshipForm> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController birthPlace = TextEditingController();
  final TextEditingController permanentAddress = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController fatherAddress = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController motherAddress = TextEditingController();

  String gender = 'Male';

  final cdatabseRef = FirebaseDatabase.instance.ref('Citizenship');
  final auth = FirebaseAuth.instance;

  void insertRecord() {
    final uid = auth.currentUser!.uid;
    final childId = DateTime.now().millisecondsSinceEpoch;
    cdatabseRef.child(uid).child(childId.toString()).set({
      'id': uid,
      'name': userName.text,
      'birthPlace': birthPlace.text,
      'permanentAddress': permanentAddress.text,
      'gender': gender,
      'dob': dateOfBirth.text,
      'fatherName': fatherAddress.text,
      'fatherAddress': fatherAddress.text,
      'motherName': motherName.text,
      'motherAddress': motherAddress.text,
    }).then((value) {
      ToastMessage().successMessage('Successfully Uploaded');
      Navigator.pushNamed(context, 'showList');
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
                    'Full Details of Applicant',
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

                    //===========Birth Place================
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
                  ],
                ),
              )
            ],
          ),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Parents'),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Fill Details',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
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
            )),
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
