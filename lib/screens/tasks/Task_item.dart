import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/screens/tasks/edit%20task.dart';
import 'package:todo/shared/networks/firebase/firebase_manager.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Slidable(
          startActionPane: ActionPane(motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                FirebaseManager.deleteTask(task.id);
              },
              backgroundColor: Colors.red,
              label: "Delete",
              icon: Icons.delete,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12) ,topLeft:Radius.circular(12) ),
            ),
            SlidableAction(
                onPressed: (BuildContext context) {
                  Navigator.pushNamed(context, EditTask.routeName,arguments: TaskModel(title: task.title, description: task.description, date: task.date,id: task.id));

                },
                backgroundColor: Colors.blue,
                label: "Edit",
                icon: Icons.edit),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    Text(task.description,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54)),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.done))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
