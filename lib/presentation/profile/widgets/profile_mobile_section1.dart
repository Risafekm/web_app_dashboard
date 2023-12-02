// ignore_for_file: unused_field, unused_local_variable, avoid_print, sized_box_for_whitespace, use_build_context_synchronously

import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var _userName = '';

  TextEditingController nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  // select gallery
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    try {
      String data = await Api.saveData(name: _userName, file: _image!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text('successful'),
            backgroundColor: Colors.green.withOpacity(.8),
            behavior: SnackBarBehavior.floating),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference data = Api.fireStore.collection('userProfile');

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
        StreamBuilder(
            stream: data.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Name :',
                        style: GoogleFonts.lora(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.secondary,
                            wordSpacing: 1),
                      ),
                    ),
                    Form(
                      key: formkey,
                      child: Container(
                        height: 60,
                        width: 160,
                        margin: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          onSaved: (value) {
                            _userName = value!;
                          },
                          validator: (val) => val != null && val.isNotEmpty
                              ? null
                              : 'required field',
                          initialValue: snapshot.data!.docs[0]['name'],
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2, value: 2));
            }),
        const SizedBox(height: 10),

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
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();
              saveProfile();
            }
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
