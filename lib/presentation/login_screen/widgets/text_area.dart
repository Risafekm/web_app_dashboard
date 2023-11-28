// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  String name;
  Icon prefixIcon;
  TextEditingController controller;
  String? Function(String?)? validator;

  TextArea({
    Key? key,
    required this.name,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            label: Text(
              name.toString(),
              style: TextStyle(color: Colors.grey.shade700),
            ),
            labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
            // hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconColor: const Color.fromARGB(255, 69, 68, 68),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
