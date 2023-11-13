// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class IconAvatar extends StatelessWidget {
  IconData icon;
  double size;
  double radius;
  IconAvatar({
    Key? key,
    required this.icon,
    required this.size,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: radius,
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
