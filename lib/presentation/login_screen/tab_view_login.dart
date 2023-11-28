// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:web_app_assign/application/services/methods.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

class TabViewLogin extends StatelessWidget {
  TabViewLogin({super.key});

  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Lottie.asset('assets/lottie/animation1.json',
                  height: 300, width: 300, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width * .6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        spreadRadius: 1,
                        blurRadius: 8,
                        color: Colors.grey.shade400),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'SignIn',
                          style: GoogleFonts.lora(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: TextArea(
                            controller: nameController,
                            name: 'Username',
                            prefixIcon: const Icon(Icons.person),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter email';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: TextArea(
                            controller: passController,
                            name: 'Password',
                            prefixIcon: const Icon(Icons.key),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Text(
                                'Forgot password?',
                                style: GoogleFonts.acme(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Button(
                          text: 'Login',
                          onpressed: () {
                            if (formkey.currentState!.validate()) {
                              signIn(context,
                                  email: nameController.text.trim(),
                                  password: passController.text.trim());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
