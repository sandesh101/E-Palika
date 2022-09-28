// import 'package:e_palika/widgets/custom_button.dart';
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
          content: Container(),
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
