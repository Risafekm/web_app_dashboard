// ignore_for_file: public_member_api_docs, sort_constructors_first

class ScheduleModel {
  String text;
  String subtext;

  ScheduleModel({
    required this.text,
    required this.subtext,
  });
}

List<ScheduleModel> scheduleModel = [
  ScheduleModel(text: 'Hatha Yoga', subtext: 'Today, 9am-10am'),
  ScheduleModel(text: 'Body Combat', subtext: 'Tomorrow,9am-10am'),
  ScheduleModel(text: 'Walking', subtext: 'Monday,9am-10am')
];
