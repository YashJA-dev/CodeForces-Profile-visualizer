import 'package:provider/provider.dart';
import 'package:wp_visualizer/Screens/Graphs/Tags_by_rating/ProblemsByRating.dart';
import 'package:flutter/material.dart';

class Tags_by_rating_Provider extends ChangeNotifier {
  int? _rating_dropDown1 = 800;
  int? _rating_dropDown2 = 3500;


  get rating_dropDown1 => this._rating_dropDown1;
  get rating_dropDown2 => this._rating_dropDown2;

  set rating_dropDown1(value) {
    this._rating_dropDown1 = value;
    notifyListeners();
  }
  set rating_dropDown2(value) {
    this._rating_dropDown2 = value;
    notifyListeners();
  }
}
