import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/MyproviderLanguage.dart';
import 'package:todo/shared/styles/colors.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Light",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.theme == ThemeMode.light
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white)),
                provider.theme == ThemeMode.light? Icon(
                  Icons.check,
                  color: primaryColor,
                  size: 30,
                ):
                SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.dark);

              Navigator.pop(context); // Close the Bottom sheet
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.theme == ThemeMode.dark
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black)),
                provider.theme == ThemeMode.dark? Icon(
                  Icons.check,
                  color: primaryColor,
                  size: 30,
                ):
                SizedBox.shrink()
              ],
            ),
          )
        ],
      ),
    );
  }
}
