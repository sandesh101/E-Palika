// import 'package:e_palika/widgets/custom_button.dart';
import 'package:e_palika/screens/citizenship/upload_photo.dart';
import 'package:e_palika/widgets/citizenship_parent_details.dart';
import 'package:e_palika/widgets/citizenship_user_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CitizenshipForm extends StatefulWidget {
  const CitizenshipForm({Key? key}) : super(key: key);

  @override
  State<CitizenshipForm> createState() => _CitizenshipFormState();
}

class _CitizenshipFormState extends State<CitizenshipForm> {
  // ==> Code to upload data to database <==

  insertRecord() {}

  // ==> Code to upload data to database <==

  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(''),
          content: const CitizenUserDetails(),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text(''),
            content: const CitizenParentDetails()),
        Step(
          isActive: currentStep >= 2,
          title: const Text(''),
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
