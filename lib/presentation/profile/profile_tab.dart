// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace, unused_local_variable, use_build_context_synchronously
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:web_app_assign/application/provider/theme_provider.dart';
import 'package:web_app_assign/application/services/Api_methods.dart';
import 'package:web_app_assign/application/services/utils.dart';
import 'package:web_app_assign/domain/model/scheduled_model.dart';
import 'package:web_app_assign/presentation/profile/widgets/CardItems.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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

  final CollectionReference data = Api.fireStore.collection('userProfile');

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
            child: Consumer<ThemeProvider>(
              builder:
                  (BuildContext context, ThemeProvider value, Widget? child) {
                return GestureDetector(
                  onTap: () {
                    context.read<ThemeProvider>().toggleButton();
                  },
                  child: Icon(
                    Icons.mode_night,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 848),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  height: 300,
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: data.snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                _image != null
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: MemoryImage(_image!),
                                      )
                                    : Container(
                                        height: 100,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/male.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                Positioned(
                                  bottom: -8,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      formkey.currentState!.save();
                                      selectImage();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
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
                            );
                          }),
                      const SizedBox(height: 10),
                      StreamBuilder(
                          stream: data.snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
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
                                        validator: (val) =>
                                            val != null && val.isNotEmpty
                                                ? null
                                                : 'required field',
                                        initialValue: snapshot.data!.docs[0]
                                            ['name'],
                                        style: const TextStyle(fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Container(
                              height: 20,
                            );
                          }),
                      const SizedBox(height: 20),

                      // personal details Container

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
                    ],
                  ),
                ),
              ),

              // update button

              Center(
                child: OutlinedButton(
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
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //schedule
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  'Scheduled',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.7),
                  ),
                ),
              ),

              //listView scheduled events

              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  height: 1400,
                  child: ListView.builder(
                    itemCount: scheduleModel.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 30, left: 30),
                        child: Card(
                          color: Theme.of(context).colorScheme.primary,
                          child: ListTile(
                            title: Text(
                              scheduleModel[index].text,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              scheduleModel[index].subtext,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(.7)),
                            ),
                            trailing: const Icon(Icons.arrow_forward_outlined,
                                color: Colors.white70),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
