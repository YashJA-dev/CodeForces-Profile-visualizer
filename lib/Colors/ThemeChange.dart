import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  late Color accentColor;
  late MaterialColor primaryColor;

  ThemeChange({required Color accentColor, required MaterialColor primaryColor}) {
    this.accentColor = accentColor;
    this.primaryColor = primaryColor;
    notifyListeners();
  }

  get getAccentColor => this.accentColor;

  set setAccentColor(accentColor) {
    this.accentColor = accentColor;
    notifyListeners();

  }
  get getPrimaryColor => this.primaryColor;

  set setPrimaryColor(primaryColor) {
    this.primaryColor = primaryColor;
    notifyListeners();
  } 
  
}
