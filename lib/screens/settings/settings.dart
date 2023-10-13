import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bottom_sheets/show_Theming_bottom_sheet.dart';
import 'package:todo/bottom_sheets/show_language_bottom_sheet.dart';
import 'package:todo/provider/MyproviderLanguage.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("language",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                showLanguageBottomSheet(context);
              },
              child: Container(

                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(

                    border: Border.all(color: primaryColor)
                ),
                child: Text(provider.local=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(height:18,),
            Text("Mode",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                showThemingBottomSheet(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(

                    border: Border.all(color: primaryColor)
                ),
                child: Text(provider.theme==ThemeMode.light?"LIGHT":"DARK",style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400)),
              ),
            )

          ],
        ),
      ),

    );
  }

  void showLanguageBottomSheet(BuildContext context){
    showBottomSheet(context: context,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(18),
            topRight: Radius.circular(18),
          )
      ),
      builder: (context) {
        return LanguageBottomSheet();
      },);
  }

  void showThemingBottomSheet(BuildContext context){
    showBottomSheet(context: context,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(18),
            topRight: Radius.circular(18),
          )
      ),
      builder: (context) {
        return ThemingBottomSheet();
      },);
  }
}
