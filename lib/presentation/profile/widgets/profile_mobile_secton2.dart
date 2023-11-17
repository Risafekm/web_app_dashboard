import 'package:flutter/material.dart';
import 'package:web_app_assign/presentation/profile/widgets/CardItems.dart';

class ProfileSection2 extends StatelessWidget {
  const ProfileSection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 400,
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
    );
  }
}
