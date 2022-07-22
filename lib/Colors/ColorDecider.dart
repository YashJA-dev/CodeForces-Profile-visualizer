import 'package:flutter/material.dart';

class ColorDecider{
  String rank;
  ColorDecider({required this.rank});
  
  Color getAccentColor(){
    if (rank == "newbie") {
      return Colors.white;
    } else if (rank == "pupil") {
        return Colors.white;

    } else if (rank == "specialist") {
        return Colors.black;
    } else if (rank == "expert") {
      return Colors.white;
    } else if (rank == "candidate master") {
      return Colors.black;
    } else if (rank == "master") {
      return Colors.black;
    } else if (rank == "international master") {
      return Colors.black;
    } else if (rank == "grandmaster") {
      return Colors.white;
    } else if (rank == "international grandmaster") {
      return Colors.white;
    } else if (rank == "legendary grandmaster") {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  MaterialColor getPrimaryColor() {
    if (rank == "newbie") {
      return Colors.blueGrey;
    } else if (rank == "pupil") {
      return Colors.green;
    } else if (rank == "specialist") {
      return Colors.cyan;
    } else if (rank == "expert") {
      return Colors.blue;
    } else if (rank == "candidate master") {
      return Colors.pink;
    } else if (rank == "master") {
      return Colors.amber;
    } else if (rank == "international master") {
      return Colors.orange;
    } else if (rank == "grandmaster") {
      return Colors.deepOrange;
    } else if (rank == "international grandmaster") {
      return Colors.red;
    } else if (rank == "legendary grandmaster") {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}