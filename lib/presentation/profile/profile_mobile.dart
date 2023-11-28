// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_app_assign/application/provider/theme_provider.dart';
import 'package:web_app_assign/presentation/profile/widgets/profile_mobile_section1.dart';
import 'package:web_app_assign/presentation/profile/widgets/profile_mobile_section2.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Text(
          'P R O F I L E',
          style: GoogleFonts.lora(
              fontSize: 20, color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                context.read<ThemeProvider>().toggleButton();
              },
              child: Icon(
                Icons.mode_night,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(child: ProfileSection1()),
              SizedBox(height: 45),
              ProfileSection2(),
            ],
          ),
        ),
      ),
    );
  }
}
