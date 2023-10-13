import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String local= "en" ;
  ThemeMode theme=ThemeMode.light;

  void ChangeLanguage(String LanguageCode){
    local=LanguageCode;
    notifyListeners();

  }
  void ChangeTheme(ThemeMode ThemeCode){
    theme=ThemeCode;
    notifyListeners();


  }
}