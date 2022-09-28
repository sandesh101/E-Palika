import 'package:e_palika/screens/birth_certificate/birth_certificate_details.dart';
import 'package:e_palika/screens/birth_certificate/birth_certificate_form.dart';
import 'package:e_palika/screens/citizenship/citizenship_details.dart';
import 'package:e_palika/screens/citizenship/citizenship_form.dart';
import 'package:e_palika/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Palika',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'citizenship_details': (context) => const CitizenshipDetails(),
        'citizenship_form': (context) => const CitizenshipForm(),
        'birthcertificate_details': (context) =>
            const BirthCertificateDetails(),
        'birthregistration_form': (context) => const BirthRegistrationForm()
      },
    );
  }
}
