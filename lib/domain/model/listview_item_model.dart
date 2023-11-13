import 'package:flutter/material.dart';

class ListModel {
  Icon icon;
  String title;
  String subTitle;

  ListModel({required this.icon, required this.subTitle, required this.title});
}

List<ListModel> listModel = [
  ListModel(
      icon: Icon(
        Icons.find_replace,
        color: Colors.amber.shade200,
        size: 28,
      ),
      subTitle: 'Calories burned',
      title: '305'),
  ListModel(
      icon: Icon(
        Icons.do_not_step_sharp,
        color: Colors.blueGrey.shade500,
        size: 28,
      ),
      subTitle: 'Steps',
      title: '10,983'),
  ListModel(
      icon: Icon(
        Icons.social_distance,
        color: Colors.green.shade200,
        size: 28,
      ),
      subTitle: 'Distance',
      title: '7km'),
  ListModel(
      icon: const Icon(
        Icons.ac_unit,
        color: Colors.blue,
        size: 28,
      ),
      subTitle: 'Sleep',
      title: '7h48m'),
];
