// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/application/services/methods.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/button.dart';
import 'package:lottie/lottie.dart';
import 'package:web_app_assign/presentation/login_screen/widgets/text_area.dart';

ValueNotifier<bool> isVisibile = ValueNotifier<bool>(true);

class MobileViewLogin extends StatelessWidget {
  MobileViewLogin({super.key});
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
                width: MediaQuery.of(context).size.width * .7,
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
                            controller: nameController,
                            name: 'Username',
                            obscureText: false,
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
                                  key: const ValueKey('password'),
                                  obscureText: isVisibile.value,
                                  controller: passController,
                                  name: 'Password',
                                  prefixIcon: const Icon(Icons.key),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      isVisibile.value = !isVisibile.value;
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
                                      return "weak password";
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
                        const SizedBox(height: 20),
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
