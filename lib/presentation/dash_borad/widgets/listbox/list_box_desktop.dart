// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:web_app_assign/domain/model/listview_item_model.dart';

class ListBoxDesktop extends StatelessWidget {
  const ListBoxDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 20),
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: listModel[index].icon,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      listModel[index].title,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      listModel[index].subTitle,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
