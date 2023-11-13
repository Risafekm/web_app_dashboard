// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class DrawerIconTextDesktop extends StatelessWidget {
  String text;
  IconData icon;
  VoidCallback onTap;
  bool selected;

  DrawerIconTextDesktop({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        selected: selected,
        onTap: onTap,
        leading: Icon(icon, color: Colors.white),
        title: Text(
          text.toString(),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
