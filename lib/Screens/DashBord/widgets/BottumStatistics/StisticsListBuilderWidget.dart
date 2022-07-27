import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'package:wp_visualizer/Model/Problems.dart';
import 'package:wp_visualizer/Screens/DashBord/widgets/BottumStatistics/stasticsTiles/RankingStatistics.dart';
import 'package:wp_visualizer/Screens/DashBord/widgets/BottumStatistics/stasticsTiles/submissionTile.dart';
import '/Model/UserData.dart';
import 'stasticsTiles/contest_blogs.dart';

class StisticsListBuilderWidget extends StatelessWidget {
  ApiData apiData;
  double height;
  double width;
  Size size;
  StisticsListBuilderWidget(
      {required this.apiData,
      required this.height,
      required this.width,
      required this.size});
  @override
  Widget build(BuildContext context) {
    UserData userData = apiData.userData;
    ProblemData problemData = apiData.problemData;
    return Container(
      height: height,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: RankingStatistics(
              userData: userData,
              height: height-40, 
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SubmissionTile(
              problemsData: problemData,
              height: height-40,

            ),
          ),Flexible(
            fit: FlexFit.tight,
            child: Contest_blogs(height: height-40,apiData: apiData),
          ),
        ],
      ),
    );
  }
}
