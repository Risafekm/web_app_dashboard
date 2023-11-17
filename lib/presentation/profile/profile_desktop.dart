// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_assign/domain/model/scheduled_model.dart';
import 'package:web_app_assign/presentation/profile/widgets/CardItems.dart';

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: .5,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 300,
                    child: Column(
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
                        const SizedBox(height: 20),

                        // personal details Container

                        Container(
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
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Scheduled',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.7),
                    ),
                  ),
                ),

                //listView scheduled events

                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.onPrimary,
                    height: 1400,
                    child: ListView.builder(
                      itemCount: scheduleModel.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 20, left: 20),
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            child: ListTile(
                              title: Text(scheduleModel[index].text),
                              subtitle: Text(scheduleModel[index].subtext),
                              trailing:
                                  const Icon(Icons.arrow_forward_outlined),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
