// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:web_app_assign/presentation/profile/widgets/profile_section1.dart';
import 'package:web_app_assign/presentation/profile/widgets/profile_section3.dart';
import 'package:web_app_assign/presentation/profile/widgets/profile_secton2.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'P R O F I L E',
          style: GoogleFonts.lora(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.black87),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(child: profileSection1()),
              SizedBox(height: 20),
              Center(child: ProfileSection2()),
              SizedBox(height: 45),
              ProfileSection3(),
            ],
          ),
        ),
      ),
    );
  }
}
