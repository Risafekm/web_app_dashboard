// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:web_app_assign/presentation/profile/widgets/profile_section1.dart';
import 'package:web_app_assign/presentation/profile/widgets/profile_section3.dart';
import 'package:web_app_assign/presentation/profile/widgets/profile_secton2.dart';

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: .5,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.black87),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(child: profileSection1()),
                  SizedBox(height: 20),
                  Center(child: ProfileSection2()),
                  SizedBox(height: 45),
                  ProfileSection3(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
