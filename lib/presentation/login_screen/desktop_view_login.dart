// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

class DesktopViewLogin extends StatelessWidget {
  const DesktopViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/background.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 231, 73)
                            .withOpacity(.5)),
                  ),
                  Positioned(
                    bottom: 370,
                    left: 160,
                    child: Text(
                      'Welcome Back',
                      style: GoogleFonts.lora(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                  ),
                  const Positioned(
                    bottom: 290,
                    left: 150,
                    child: Text(
                      'To keep connected with us please\n    login with your personal info',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54),
                    ),
                  ),
                  Positioned(
                    bottom: 210,
                    left: 200,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Container(
                          height: 40,
                          width: 140,
                          child: Center(
                            child: Text(
                              'SignUp',
                              style: GoogleFonts.lora(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            //login area

            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 20),
                    Center(
                      child: Lottie.asset('assets/lottie/animation1.json',
                          height: 300, width: 300, fit: BoxFit.cover),
                    ),
                    // const SizedBox(height: 10),
                    Center(
                      child: Container(
                        height: 300,
                        width: 350,
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
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'SignIn',
                              style: GoogleFonts.lora(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: TextArea(
                                name: 'Username',
                                prefixIcon: const Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: TextArea(
                                name: 'Password',
                                prefixIcon: const Icon(Icons.key),
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
                            const Button(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
