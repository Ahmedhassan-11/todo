import 'package:flutter/material.dart';
import 'package:todo/models/TaskModel.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
   TaskItem(this.task,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
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
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
                  Text(task.description, style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54)),


                ],
              ),
              Spacer(),
              IconButton(onPressed:(){}, icon: Icon(Icons.done))
            ],
          ),
        ),
      ),
    );
  }
}
