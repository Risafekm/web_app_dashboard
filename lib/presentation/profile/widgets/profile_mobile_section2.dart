// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class ProfileSection2 extends StatelessWidget {
  const ProfileSection2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27.0, bottom: 10),
            child: Text(
              'Scheduled',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21,
                color: Theme.of(context).colorScheme.secondary.withOpacity(.7),
              ),
            ),
          ),
          cardsArea(context, text: 'Hatha Yoga', subtitle: 'Today, 9am-10am'),
          const SizedBox(height: 10),
          cardsArea(context,
              text: 'Body Combat', subtitle: 'Tomorrow, 9am-10am'),
          const SizedBox(height: 10),
          cardsArea(context, text: 'Hatha Yoga', subtitle: 'Monday,9am-10am'),
        ],
      ),
    );
  }

  Widget cardsArea(BuildContext context,
      {required String text, required String subtitle}) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        height: 70,
        width: 450,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          subtitle.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(.7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                right: 10,
                top: 10,
                child: Expanded(
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
