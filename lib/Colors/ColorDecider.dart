import 'package:flutter/material.dart';

class ColorDecider{
  String? rank;
  int? rating;
  ColorDecider.fromRating({required this.rating});
  ColorDecider.fromRank({required this.rank});
  
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
  MaterialColor decideByRating(){
    print("rating $rating");
    if(rating!<1200){
      return getPrimaryColor(rank: "newbie");
    }else if(rating!<1400){
      return getPrimaryColor(rank: "pupil");
    }else if(rating!<1600){
      return getPrimaryColor(rank: "specialist");
    }else if(rating!<1900){
      return getPrimaryColor(rank: "expert");
    }else if(rating!<2100){
      return getPrimaryColor(rank: "candidate master");
    }else if(rating!<2300){
      return getPrimaryColor(rank: "master");
    }else if(rating!<2400){
      return getPrimaryColor(rank: "international master");
    }else if(rating!<2600){
      return getPrimaryColor(rank: "grandmaster");
    }else if(rating!<3000){
      return getPrimaryColor(rank: "international grandmaster");
    }else {
      return getPrimaryColor(rank: "legendary grandmaster");
    }
  }
  MaterialColor getPrimaryColor({String rank="getUp"}) {
    if(rank=="getUp"){
      rank=this.rank!;
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