import 'package:flutter/material.dart';

import '../citizenship/upload_photo.dart';

class BirthRegistrationForm extends StatefulWidget {
  const BirthRegistrationForm({Key? key}) : super(key: key);

  @override
  _BirthRegistrationFormState createState() => _BirthRegistrationFormState();
}

class _BirthRegistrationFormState extends State<BirthRegistrationForm> {
  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(''),
          content: Container(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(''),
          content: Container(),
        ),
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
              // print("Completed");
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            currentStep == 0
                ? null
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
