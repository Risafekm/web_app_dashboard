// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, use_build_context_synchronously
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

class ProfileDesktop extends StatefulWidget {
  const ProfileDesktop({super.key});

  @override
  State<ProfileDesktop> createState() => _ProfileDesktopState();
}

class _ProfileDesktopState extends State<ProfileDesktop> {
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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(
          left: .5,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                                                  image: NetworkImage(
                                                      'https://firebasestorage.googleapis.com/v0/b/chatapp-524cb.appspot.com/o/profileImage.jpg?alt=media&token=9d8fdaeb-961b-4973-b945-bf647ab0bc39'),
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
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Form(
                                      key: formkey,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 28),
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .13,
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
                                  ),
                                );
                              }
                              return Container(
                                height: 20,
                              );
                            }),
                        const SizedBox(height: 10),
                        Text(
                          'Edit health details',
                          style: GoogleFonts.acme(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
                              wordSpacing: 1),
                        ),
                        const SizedBox(height: 20),

                        // personal details Container

                        Container(
                          height: 70,
                          width: 400,
                          constraints: const BoxConstraints(minWidth: 907),
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
                const SizedBox(height: 10),

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

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      Text(
                        'Theme Mode',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.7),
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
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
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Scheduled',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.7),
                    ),
                  ),
                ),

                //listView scheduled events

                Expanded(
                  child: Container(
                    height: 1400,
                    child: ListView.builder(
                      itemCount: scheduleModel.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 20, left: 20),
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            child: ListTile(
                              title: Text(
                                scheduleModel[index].text,
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
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
      ),
    );
  }
}
