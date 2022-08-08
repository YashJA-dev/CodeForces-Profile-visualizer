import 'package:provider/provider.dart';
import 'package:wp_visualizer/Screens/Graphs/Tags_by_rating/Tags_by_rating.dart';
import 'package:flutter/material.dart';

class Tags_by_rating_Provider extends ChangeNotifier {
  int? _rating_dropDown1 = 800;
  int? _rating_dropDown2 = 3500;
  int _touchedIndex=-1;

  get rating_dropDown1 => this._rating_dropDown1;
  get rating_dropDown2 => this._rating_dropDown2;
  get touchedIndex => this._touchedIndex;
  set rating_dropDown1(value) {
    this._rating_dropDown1 = value;
    notifyListeners();
  }
  set touchedIndex(value){
    this._touchedIndex=value;
    notifyListeners();
  }
  set rating_dropDown2(value) {
    this._rating_dropDown2 = value;
    notifyListeners();
  }
}
