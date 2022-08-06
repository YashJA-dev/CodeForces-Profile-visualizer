import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Controller/Fetching Api/problems_Fetcher.dart';
import '../../../../Model/Problems.dart';

List<PieChartSectionData> getSections_vberdicts (
    {required ProblemData problemData, required int index}) {
  double touched_radius = 165;
  double touched_text = 15;
  double fontSize_notTouched = 13;
  double radiousSectionSize = 155;
  List<PieChartSectionData> pieChartSection_list = [];
  List<ProblemsInfo> problems_list = problemData.getResult;
  Map<String, PiChartData_rating> verdictMap = problemData.verdicts_data_pie;
  double totalSubbmissions = problems_list.length * 1.0;
  int index_iterate = 0;
  verdictMap.forEach((k, v) {
    String verdict = k;
    PiChartData_rating pie_data = v;
    double submissions = pie_data.count * 1.0;
    double percentage = (submissions / totalSubbmissions) * 100.0;
    if (percentage > 0) {
      PieChartSectionData pieChartSectionData = PieChartSectionData(
        title: getTitleOfPortion(percentage: percentage, verdict: verdict),
        color: pie_data.color,
        titleStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: index_iterate == index ? touched_text : fontSize_notTouched,
        ),
        value: percentage,
        radius: index_iterate == index ? touched_radius : radiousSectionSize,
      );
      index_iterate++;
      pieChartSection_list.add(pieChartSectionData);
    }
  });
  return pieChartSection_list;
}

String getTitleOfPortion(
    {required String verdict, required double percentage}) {
  percentage = double.parse(percentage.toStringAsFixed(2));
  return percentage >= 9
      ? "${getShortFormVerdict(verdict: verdict)} \n ${percentage}%"
      : "";
}

String getShortFormVerdict({required String verdict}) {
  switch (verdict) {
    case "OK":
      return "A.C";
    case "WRONG_ANSWER":
      return "W.A";
    case "RUNTIME_ERROR":
      return "R.T.E";
    case "TIME_LIMIT_EXCEEDED":
      return "T.L.E";
    case "MEMORY_LIMIT_EXCEEDED":
      return "M.L.E";
    case "COMPILATION_ERROR":
      return "Compi.. Err";
    case "IDLENESS_LIMIT_EXCEEDED":
      return "Idle ness L.E";
    case "PRESENTATION_ERROR":
      return "P.E";
    default:
      return verdict.toString();
  }
}

List<Widget> getSectionIndectors(
    {required ProblemData problemData, required int index,required Function indecatorPressed}) {
  List<Widget> indecators = [];

  List<Container> indecatorsRow =
      _indecatorsInRow(problemData: problemData, index: index);

  for (int i = 0; i < indecatorsRow.length; i = i + 4) {
    List<GestureDetector> fourSizedRow = [];
    for (int j = i; (j < i + 4) && (j < indecatorsRow.length); j++) {
      fourSizedRow.add(
        GestureDetector(
          child: Container(
            margin: EdgeInsets.all(5),
            child: indecatorsRow[j],
          ),
          onTapUp: (_) {
            indecatorPressed(index: j);
          },
          onTapDown: (_) {
            indecatorPressed(index: -1);
          },
        )
      );
    }
    indecators.add(Column(children: fourSizedRow));
  }
  return indecators;
}

List<Container> _indecatorsInRow(
    {required ProblemData problemData, required int index}) {
  Map<String, PiChartData_rating> verdictMap = problemData.verdicts_data_pie;
  List<Container> indecatorsRow = [];
  List<ProblemsInfo> problems_list = problemData.getResult;
  double totalSubbmissions = problems_list.length * 1.0;
  int index_iterator = 0;
  verdictMap.forEach(
    (k, pie_data) {
      double submissions = pie_data.count * 1.0;
      double percentage = (submissions / totalSubbmissions) * 100.0;
      percentage = double.parse(percentage.toStringAsFixed(2));
      if (percentage > 0) {
        Row rowData = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: index_iterator == index ? 15 : 10,
              width: index_iterator == index ? 15 : 10,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: pie_data.color),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 120,
              child: Row(children: [
                Container(
                  width: 50,
                  child: Text(
                    "${getShortFormVerdict(verdict: k)}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text(
                    "${percentage}%",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ]),
            )
          ],
        );

        indecatorsRow.add(Container(width: 145,child: rowData));
        index_iterator++;
      }
    },
  );
  return indecatorsRow;
}
