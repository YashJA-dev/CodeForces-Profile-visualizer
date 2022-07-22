import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wp_visualizer/Colors/ColorDecider.dart';
import '/Model/UserData.dart';

class StisticsGridBuilderWidget extends StatelessWidget {
  UserData userData;
  double height;
  double width;
  Size size;
  StisticsGridBuilderWidget(
      {required this.userData,
      required this.height,
      required this.width,
      required this.size});
  @override
  Widget build(BuildContext context) {
    double heightForStats = height * 0.28;
    return Container(
      height: height,
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RankingVisualize(
              size: size,
              height: heightForStats,
              width: width,
              userData: userData,
            ),
            RankingVisualize(
              size: size,
              height: heightForStats,
              width: width,
              userData: userData,
            ),
            RankingVisualize(
              size: size,
              height: heightForStats,
              width: width,
              userData: userData,
            ),
          ],
        ),
      ),
    );
  }
}

class RankingVisualize extends StatelessWidget {
  Size size;
  double height;
  double width;
  UserData userData;
  RankingVisualize(
      {required this.height,
      required this.size,
      required this.width,
      required this.userData});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        height: height,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height,
                width: width * 0.4,
                padding: EdgeInsets.all(15),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                        Text(
                          "Rating ",
                          style: TextStyle(
                              fontSize: height*0.1 ,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${userData.rating}",
                          style: TextStyle(
                              fontSize: height*0.1, 
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ]),
                      Column(children: [
                        Row(
                        children: [
                        Text(
                          "Frnds of ",
                          style: TextStyle(
                              fontSize: height*0.09, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${userData.friendOfCount}",
                          style: TextStyle(
                              fontSize: height*0.1, 
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ]),
                      Row(
                        children: [
                        Text(
                          "Contrib.. ",
                          style: TextStyle(
                              fontSize: height*0.1, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${userData.contribution}",
                          style: TextStyle(
                              fontSize: height*0.1, 
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ])
                      ],)
                      ,
                      
                    ]),
              ),
              Container(
                height: size.height,
                width: width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Flexible(
                          child: Image.asset(
                        "images/chart-going-up.jpg",
                        fit: BoxFit.fill,
                      )),
                    ),
                    Text("Maximum Rank "),
                    Text(
                      "${userData.maxRank} \n ( ${userData.maxRating} )",
                      style: TextStyle(
                          color: ColorDecider(rank: userData.maxRank)
                              .getPrimaryColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: height*0.1),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
