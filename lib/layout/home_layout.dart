import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/MyproviderLanguage.dart';
import 'package:todo/screens/settings/settings.dart';
import 'package:todo/screens/tasks/addTaskButtonSheet.dart';
import 'package:todo/screens/tasks/tasks_tab.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homelayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int Index = 0;
  List<Widget> tabs = [TasksTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.todo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ShowSheet();
          },
          child: Icon(Icons.add)),
      bottomNavigationBar: BottomAppBar(
        color: provider.theme==ThemeMode.light ?
        Colors.white :Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: Index,
          onTap: (value) {
            Index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "",
                backgroundColor: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
      body: tabs[Index],
    );
  }

  void ShowSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet(),
        );
      },
    );
  }
}
