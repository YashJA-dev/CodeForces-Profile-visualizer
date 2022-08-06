import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/Problems.dart';

import '../../../../Controller/Fetching Api/problems_Fetcher.dart';

List<PieChartSectionData> getSections_language({
  required ProblemData problemData,
  required int index,
}) {
  double touched_radius = 165;
  double touched_text = 12;
  double fontSize_notTouched = 11;
  double radiousSectionSize = 155;
  List<ProblemsInfo> problems_list = problemData.getResult;
  List<PieChartSectionData> pieChartSection_list = [];
  Map<String, PiChartData_rating> languagesMap = problemData.languages_data_pie;
  double totalSubbmissions = problems_list.length * 1.0;
  int index_iterate = 0;
  languagesMap.forEach((k, v) {
    String language = k;
    PiChartData_rating pie_data = v;
    double subbmisons = pie_data.count * 1.0;
    double percentage = (subbmisons / totalSubbmissions) * 100.0;
    if (percentage > 0) {
      PieChartSectionData peiChartSection = PieChartSectionData(
        title: _getTitlePortion(language, percentage),
        titleStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: index_iterate == index ? touched_text : fontSize_notTouched,
        ),
        value: percentage,
        color: pie_data.color,
        radius: index_iterate == index ? touched_radius : radiousSectionSize,
      );
      index_iterate++;
      pieChartSection_list.add(peiChartSection);
    }
  });
  return pieChartSection_list;
}

String _getTitlePortion(String language, double percentage) {
  percentage = percentage = double.parse(percentage.toStringAsFixed(2));
 
  // language=list[0]+list[1%list.length]+"\n $percentage %";

  return percentage > 5 ? percentage.toString()+"%" : "";
}

List<Widget> getSectionIndectors(
    {required ProblemData problemData,
    required int index,
    required Function indecatorPressed}) {
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
        ),
      );
    }
    indecators.add(Column(children: fourSizedRow));
  }
  return indecators;
}

List<Container> _indecatorsInRow(
    {required ProblemData problemData, required int index}) {
  Map<String, PiChartData_rating> language_pieData =
      problemData.languages_data_pie;
  List<Container> indecatorsRow = [];
  List<ProblemsInfo> problems_list = problemData.getResult;
  double totalSubbmissions = problems_list.length * 1.0;
  int index_iterator = 0;
  language_pieData.forEach(
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
              width: 200,
              child: Row(children: [
                Container(
                  width: 125,
                  child: Text(
                    "$k",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
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
                        fontSize: 16),
                  ),
                ),
              ]),
            )
          ],
        );

        indecatorsRow.add(Container(width: 225, child: rowData,));
        index_iterator++;
      }
    },
  );
  return indecatorsRow;
}
