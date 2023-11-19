// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  String title;
  String value;
  CardItems({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title.toString(),
          overflow: TextOverflow.fade,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.tertiary.withOpacity(.7),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Theme.of(context).colorScheme.tertiary),
        ),
      ],
    );
  }
}
