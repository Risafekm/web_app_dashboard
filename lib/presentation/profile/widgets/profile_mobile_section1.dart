import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection1 extends StatelessWidget {
  const ProfileSection1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/risaf.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'RISAFE K M',
          style: GoogleFonts.lora(
              fontSize: 22,
              color: Theme.of(context).colorScheme.secondary,
              wordSpacing: 1),
        ),
        const SizedBox(height: 3),
        Text(
          'Edit health details',
          style: GoogleFonts.acme(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondary,
              wordSpacing: 1),
        ),
      ],
    );
  }
}
