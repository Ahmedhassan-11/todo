import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/Task_item.dart';
import 'package:todo/shared/networks/firebase/firebase_manager.dart';
import 'package:todo/shared/styles/colors.dart';

class TasksTab extends StatefulWidget {

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
 DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(color: Colors.blue,
              width: double.infinity,
              height: 80),
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date){
              selectedDate=date;
              setState(() {

              });
            },
            leftMargin: 20,
            monthColor: primaryColor,
            dayColor: Colors.white,
            activeDayColor: primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => date.day != 28,
            locale: 'en_ISO',
          ),
        ]),
        Expanded(
            child: StreamBuilder(
              stream: FirebaseManager.getTask(selectedDate), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Somthing went wrong"));
              }
              var tasks =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              return ListView.builder(itemBuilder: (context, index) {
                return TaskItem(tasks[index]);
              },itemCount: tasks.length,);
            },)
        )
      ],
    );
  }
}
