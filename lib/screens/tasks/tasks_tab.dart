import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/Task_item.dart';
import 'package:todo/shared/styles/colors.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(color: Colors.blue,
              width: double.infinity,
              height: 80),
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate:DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: primaryColor,
            dayColor: Colors.white,
            activeDayColor: primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => date.day!=28,
            locale: 'en_ISO',
          ),
        ]),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return TaskItem();
          },itemCount: 8,),
        )
      ],
    );
  }
}
