import 'package:e_palika/screens/birth_certificate/birth_certificate_details.dart';
import 'package:e_palika/screens/birth_certificate/birth_certificate_form.dart';
import 'package:e_palika/screens/citizenship/citizenship_details.dart';
import 'package:e_palika/screens/citizenship/citizenship_form.dart';
import 'package:e_palika/screens/citizenship/upload_photo.dart';
import 'package:e_palika/screens/home_screen.dart';
import 'package:e_palika/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        'home': (context) => const HomePage(),
        'upload_photo': (context) => const PickImage(),
        'citizenship_details': (context) => const CitizenshipDetails(),
        'citizenship_form': (context) => const CitizenshipForm(),
        'birthcertificate_details': (context) =>
            const BirthCertificateDetails(),
        'birthregistration_form': (context) => const BirthRegistrationForm()
      },
    );
  }
}
