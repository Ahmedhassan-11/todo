import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/provider/MyproviderLanguage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/shared/networks/firebase/firebase_manager.dart';
import 'package:todo/shared/styles/colors.dart';

class EditTask extends StatefulWidget {
  static const String routeName="edit";
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  var SelectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
var getdate;
bool selectedtime=false;

  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)!.settings.arguments as TaskModel;
    var provider = Provider.of<MyProvider>(context);
    titleController.text=arg.title;
    descriptionController.text=arg.description;
    DateTime getdate=DateTime.fromMillisecondsSinceEpoch(arg.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todo,style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Edit task",
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
                        child: Text(
                           "${Getdate()}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, color: Colors.blue)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            FirebaseManager.Edit(TaskModel(title: titleController.text,
                                description: descriptionController.text, date: Pushdate()));
                            Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);

                          },
                          child: Text(
                            "Update",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            textAlign: TextAlign.center,
                          ))
                    ]),
              )
            ],
          ),
        ),
      ),
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
    selectedtime=true;
    setState(() {});
  }
  Getdate(){
   return selectedtime==false? getdate.toString().substring(0, 10):
    SelectedDate.toString().substring(0, 10);
  }
  Pushdate(){
    return selectedtime==false? DateUtils.dateOnly(getdate).millisecondsSinceEpoch:
    DateUtils.dateOnly( SelectedDate).millisecondsSinceEpoch;
  }
}
