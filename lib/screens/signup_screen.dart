import 'package:e_palika/constants/colors.dart';
import 'package:e_palika/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/toast_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  bool isObscure = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create an Account',
              style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: AppColors.accentColor,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Email ID",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: TextFormField(
                obscureText: isObscure,
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: isObscure == true
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = false;
                            });
                          },
                          child: const Icon(
                            Icons.visibility,
                            color: AppColors.accentColor,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = true;
                            });
                          },
                          child: const Icon(
                            Icons.visibility_off,
                            color: AppColors.accentColor,
                          ),
                        ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppColors.accentColor,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Password",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Buttons(
              buttonText: "Sign Up",
              buttonColor: AppColors.secondaryColor,
              onClick: () {
                _auth
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) {
                  ToastMessage().successMessage("User Registered");
                }).onError((error, stackTrace) {
                  ToastMessage().errorMessage(error.toString());
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "login");
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: AppColors.accentColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
