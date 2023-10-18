import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/shared/networks/firebase/firebase_manager.dart';
import 'package:todo/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var SelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add new task",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  label: Text("Task title"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primaryColor))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  label: Text(" Task Description"),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primaryColor))),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Selected date",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                SelectDate(context);
              },
              child: Text(SelectedDate.toString().substring(0, 10),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, color: Colors.blue)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  TaskModel task = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: DateUtils.dateOnly(SelectedDate).millisecondsSinceEpoch);
                  FirebaseManager.addTasks(task)
                      .then((value) => {Navigator.pop(context)});
                },
                child: Text(
                  "add task",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                ))
          ]),
    );
  }

  SelectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) {
      return;
    }
    SelectedDate = chosenDate;
    setState(() {});
  }
}
