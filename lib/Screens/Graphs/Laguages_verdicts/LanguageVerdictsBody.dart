import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'package:wp_visualizer/Model/Problems.dart';

import 'PieChart_Sections_Languages/PieChartSections_Languages.dart';

class LanguageVerdictsBody extends StatefulWidget {
  ProblemData problemData;
  LanguageVerdictsBody({required this.problemData});
  @override
  State<LanguageVerdictsBody> createState() => _LanguageVerdictsBodyState();
}

class _LanguageVerdictsBodyState extends State<LanguageVerdictsBody> {
  int touchedIndex=-1;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double height = (mediaQuery.size.height) -
        AppBar().preferredSize.height -
        mediaQuery.viewPadding.top;
    ;
    double width = mediaQuery.size.width;
    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 3,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                  } else {
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  }
                  setState(() {
                    touchedIndex;
                  });
                }),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: getSections_language(
                    problemData: widget.problemData, index: touchedIndex),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: getSectionIndectors(
                      problemData: widget.problemData, index: touchedIndex,indecatorPressed: indecatorPressed),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void indecatorPressed({required index}){
    setState(() {
      touchedIndex=index;
    });
  }
}
