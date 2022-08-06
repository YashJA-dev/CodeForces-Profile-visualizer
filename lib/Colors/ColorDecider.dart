import 'package:flutter/material.dart';

class ColorDecider {
  String? rank;
  int? rating;
  List<Color> colors_list = [
    Color.fromRGBO(139, 195, 74, 1),
    Color.fromRGBO(245, 67, 55, 1),
    Color.fromRGBO(232, 30, 98, 1),
    Color.fromRGBO(157, 38, 176, 1),
    Color.fromRGBO(33, 150, 243, 1),
    Color.fromRGBO(1, 150, 137, 1),
    
    Color.fromRGBO(205, 221, 56, 1),
    Color.fromRGBO(255, 193, 7, 1),
    Color.fromRGBO(255, 152, 0, 1),
    Color.fromRGBO(254, 86, 34, 1),
    Color.fromRGBO(121, 84, 73, 1),
    Color.fromRGBO(97, 124, 139, 1),
    Color.fromRGBO(231, 81, 1, 1),
    Color.fromRGBO(231, 81, 1, 1),
    Color.fromRGBO(130, 118, 22, 1),
    Color.fromRGBO(0, 77, 64, 1),
    Color.fromRGBO(26, 35, 126, 1),
    Color.fromRGBO(99, 0, 235, 1),
    Color.fromRGBO(62, 81, 180, 1),
    Color.fromRGBO(245, 0, 87, 1),
    Color.fromRGBO(48, 78, 255, 1),
    Color.fromRGBO(183, 29, 29, 1),
    Color.fromRGBO(245, 67, 55, 1),
    Color.fromRGBO(232, 30, 98, 1),
    Color.fromRGBO(157, 38, 176, 1),
    Color.fromRGBO(33, 150, 243, 1),
    Color.fromRGBO(1, 150, 137, 1),
    Color.fromRGBO(139, 195, 74, 1),
    Color.fromRGBO(226, 235, 140, 1),
    Color.fromRGBO(255, 193, 7, 1),
    Color.fromRGBO(255, 152, 0, 1),
    Color.fromRGBO(254, 86, 34, 1),
    Color.fromRGBO(121, 84, 73, 1),
    Color.fromRGBO(204, 205, 205, 1),
    Colors.pink,
    Colors.redAccent,
    Colors.purple,
    Colors.amber,
  ];

  ColorDecider.fromRating({required this.rating});
  ColorDecider.fromRank({required this.rank});
  ColorDecider();
  Color getAccentColor() {
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

  get colorslist => this.colors_list;
  MaterialColor decideByRating() {
    if (rating! < 1200) {
      return getPrimaryColor(rank: "newbie");
    } else if (rating! < 1400) {
      return getPrimaryColor(rank: "pupil");
    } else if (rating! < 1600) {
      return getPrimaryColor(rank: "specialist");
    } else if (rating! < 1900) {
      return getPrimaryColor(rank: "expert");
    } else if (rating! < 2100) {
      return getPrimaryColor(rank: "candidate master");
    } else if (rating! < 2300) {
      return getPrimaryColor(rank: "master");
    } else if (rating! < 2400) {
      return getPrimaryColor(rank: "international master");
    } else if (rating! < 2600) {
      return getPrimaryColor(rank: "grandmaster");
    } else if (rating! < 3000) {
      return getPrimaryColor(rank: "international grandmaster");
    } else {
      return getPrimaryColor(rank: "legendary grandmaster");
    }
  }

  MaterialColor getPrimaryColor({String rank = "getUp"}) {
    if (rank == "getUp") {
      rank = this.rank!;
    }
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
