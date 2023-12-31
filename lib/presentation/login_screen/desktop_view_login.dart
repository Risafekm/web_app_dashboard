// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:web_app_assign/application/services/Api_methods.dart';
import 'package:web_app_assign/presentation/login_screen/mobile_view_login.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button/button_desktop.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

class DesktopViewLogin extends StatelessWidget {
  DesktopViewLogin({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();

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
                        height: MediaQuery.of(context).size.height * .45,
                        width: MediaQuery.of(context).size.width * .3,
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
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                const SizedBox(height: 30),
                                Center(
                                  child: TextArea(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: nameController,
                                    obscureText: false,
                                    name: 'Username',
                                    prefixIcon: const Icon(Icons.person),
                                    suffixIcon: const Icon(
                                      Icons.abc,
                                      color: Colors.transparent,
                                    ),
                                    validator: (value) {
                                      bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!);
                                      if (value.isEmpty) {
                                        return 'please enter email';
                                      } else if (!emailValid) {
                                        return 'enter valid email';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ListenableBuilder(
                                    listenable: isVisibile,
                                    builder: (BuildContext context, value) {
                                      return Center(
                                        child: TextArea(
                                          keyboardType: TextInputType.text,
                                          obscureText: isVisibile.value,
                                          controller: passController,
                                          name: 'Password',
                                          prefixIcon: const Icon(Icons.key),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              isVisibile.value =
                                                  !isVisibile.value;
                                            },
                                            child: isVisibile.value
                                                ? const Icon(
                                                    Icons.visibility,
                                                    color: Colors.black,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.black,
                                                  ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter password';
                                            } else if (value.length < 6) {
                                              return "should be more than 6 characters";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      );
                                    }),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 40.0),
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
                                const SizedBox(height: 20),
                                ButtonDesktop(
                                  text: 'Login',
                                  onpressed: () {
                                    if (formkey.currentState!.validate()) {
                                      Api.signIn(
                                        context,
                                        email: nameController.text.trim(),
                                        password: passController.text.trim(),
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
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
