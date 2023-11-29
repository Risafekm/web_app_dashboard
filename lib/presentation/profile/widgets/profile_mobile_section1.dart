// ignore_for_file: unused_field, unused_local_variable, avoid_print, sized_box_for_whitespace

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/application/services/Api_methods.dart';
import 'package:web_app_assign/application/services/utils.dart';
import 'package:web_app_assign/presentation/profile/widgets/CardItems.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSection1 extends StatefulWidget {
  const ProfileSection1({
    super.key,
  });

  @override
  State<ProfileSection1> createState() => _ProfileSection1State();
}

class _ProfileSection1State extends State<ProfileSection1> {
  Uint8List? _image;

  TextEditingController nameController = TextEditingController();

  // select gallery
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String data = await Api.saveData(name: nameController.text, file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: MemoryImage(_image!),
                  )
                : const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/risaf.jpg'),
                  ),
            Positioned(
              bottom: -8,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  selectImage();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Name   :',
                style: GoogleFonts.lora(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.secondary,
                    wordSpacing: 1),
              ),
            ),
            Container(
              height: 60,
              width: 140,
              margin: const EdgeInsets.only(left: 20),
              // padding: EdgeInsets.only(left: 30),
              child: TextFormField(
                controller: nameController,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  hintText: 'RISAFE KM',
                  hintStyle: GoogleFonts.lora(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.secondary,
                      wordSpacing: 1),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),

        //  health section
        // health area title
        Text(
          'Edit health details',
          style: GoogleFonts.acme(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondary,
              wordSpacing: 1),
        ),

        const SizedBox(height: 10),

        //health bar

        Container(
          height: 70,
          width: 400,
          margin: const EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardItems(
                  title: 'Weight',
                  value: '73kg',
                ),
                CardItems(
                  title: 'Height',
                  value: '183cm',
                ),
                CardItems(
                  title: 'Blood Type',
                  value: 'O+',
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
        // update button

        OutlinedButton(
          onPressed: () {
            saveProfile();
          },
          style: OutlinedButton.styleFrom(
              side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          )),
          child: Text(
            'Update',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
