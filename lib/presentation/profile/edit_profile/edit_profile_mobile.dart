// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_app_assign/application/services/Api_methods.dart';
import 'package:web_app_assign/application/services/utils.dart';

class EditProfileMobile extends StatefulWidget {
  const EditProfileMobile({
    super.key,
  });

  @override
  State<EditProfileMobile> createState() => _EditProfileMobileState();
}

class _EditProfileMobileState extends State<EditProfileMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: const Text(
            'Profile Screen',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://buffer.com/library/content/images/2023/10/free-images.jpg',
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                height: 180,
                                width: 180,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.amber,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: MediaQuery.of(context).size.width * .32,
                      child: MaterialButton(
                        onPressed: () {
                          _showBottomSheet();
                        },
                        color: Colors.white,
                        shape: const CircleBorder(),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // TextFormField fields

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: 'RISAFE KM',
                    onSaved: (val) => Api.me.name = val ?? '',
                    validator: (val) =>
                        val != null && val.isNotEmpty ? null : 'required field',
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: const Text(
                        'Name',
                      ),
                      hintText: 'eg : Arun',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black.withOpacity(.6),
                        size: 26,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: 'I am good ',
                    onSaved: (val) => Api.me.about = val ?? '',
                    validator: (val) =>
                        val != null && val.isNotEmpty ? null : 'required field',
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'eg : feel good',
                      label: const Text(
                        'About',
                      ),
                      prefixIcon: Icon(
                        Icons.error,
                        color: Colors.black.withOpacity(.6),
                        size: 26,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Update  Button

                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.white)))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Api.updateUserInfo().then((value) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //         content: const Text('successful'),
                        //         backgroundColor: Colors.green.withOpacity(.8),
                        //         behavior: SnackBarBehavior.floating),
                        //   );
                        //   Future.delayed(
                        //       const Duration(
                        //         milliseconds: 500,
                        //       ), () {
                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const ChatHome()));
                        //   });
                        // });
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 22),
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

  _showBottomSheet() {
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 5, right: 8, left: 8, bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey,
              ),
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      selectImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child: SizedBox(
                      height: 90,
                      width: 100,
                      child: Image.asset(
                        'assets/file.png',
                        scale: 9.3,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      height: 90,
                      width: 100,
                      child: Image.asset(
                        'assets/camera.webp',
                        scale: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 4,
              right: 150,
              left: 150,
              child: Container(
                height: 5,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
