// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  String name;
  Icon prefixIcon;
  TextArea({
    Key? key,
    required this.name,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Expanded(
        child: Container(
          width: 400,
          height: 60,
          child: TextField(
            decoration: InputDecoration(
              label: Text(
                name.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              labelStyle: const TextStyle(color: Colors.white),
              // hintText: hintText,
              prefixIcon: prefixIcon,
              prefixIconColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 192, 229, 230),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
