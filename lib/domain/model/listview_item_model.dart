import 'package:flutter/material.dart';

class ListModel {
  Icon icon;
  String title;
  String subTitle;

  ListModel({required this.icon, required this.subTitle, required this.title});
}

List<ListModel> listModel = [
  ListModel(
      icon: const Icon(
        Icons.find_replace,
        color: Colors.amber,
        size: 28,
      ),
      subTitle: 'Calories burned',
      title: '305'),
  ListModel(
      icon: const Icon(
        Icons.do_not_step_sharp,
        color: Colors.orange,
        size: 28,
      ),
      subTitle: 'Steps',
      title: '10,983'),
  ListModel(
      icon: const Icon(
        Icons.social_distance,
        color: Colors.lime,
        size: 28,
      ),
      subTitle: 'Distance',
      title: '7km'),
  ListModel(
      icon: const Icon(
        Icons.ac_unit,
        color: Colors.pink,
        size: 28,
      ),
      subTitle: 'Sleep',
      title: '7h48m'),
];
