import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/MyproviderLanguage.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color:provider.local=="en"?MyThemeData.primary:MyThemeData.blackColor)),

                provider.local=="en"? Icon(Icons.check,color: primaryColor,size: 30,)
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.ChangeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color:provider.local=="ar"?MyThemeData.primary:MyThemeData.blackColor)),


               provider.local=="ar"? Icon(Icons.check,color: primaryColor,size: 30,)
               : SizedBox.shrink()
              ],
            ),
          )
        ],
      ),
    );
  }
}
