// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_app_assign/application/provider/theme_provider.dart';
import 'package:web_app_assign/domain/model/scheduled_model.dart';
import 'package:web_app_assign/presentation/profile/widgets/CardItems.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Text(
          'P R O F I L E',
          style: GoogleFonts.lora(
              fontSize: 20, color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Consumer<ThemeProvider>(
              builder:
                  (BuildContext context, ThemeProvider value, Widget? child) {
                return GestureDetector(
                  onTap: () {
                    context.read<ThemeProvider>().toggleButton();
                  },
                  child: Icon(
                    Icons.mode_night,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 848),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
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
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  'Scheduled',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.7),
                  ),
                ),
              ),

              //listView scheduled events

              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  height: 1400,
                  child: ListView.builder(
                    itemCount: scheduleModel.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 30, left: 30),
                        child: Card(
                          color: Theme.of(context).colorScheme.primary,
                          child: ListTile(
                            title: Text(scheduleModel[index].text),
                            subtitle: Text(scheduleModel[index].subtext),
                            trailing: const Icon(Icons.arrow_forward_outlined),
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
    );
  }
}
