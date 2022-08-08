import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Providers/TagsByRating_Provider.dart';

import '../../../../../../../Controller/Fetching Api/problems_Fetcher.dart';
import '../../../../../../../Model/Problems.dart';

List<PieChartSectionData> getTags_Sections(
    {required Map<String, PiChartData_rating> tagsMap,
    required double totalSubbmissions,required BuildContext context}) {
  double touched_radius = 165;
  double touched_text = 15;
  double fontSize_notTouched = 13;
  double radiousSectionSize = 155;
  List<PieChartSectionData> pieChartSection_list = [];
  var provider=Provider.of<Tags_by_rating_Provider>(context,listen: true);
  int index=provider.touchedIndex;
  int index_iterate = 0;
  double total=0;
  tagsMap.forEach((k, v) {
    String verdict = k;
    PiChartData_rating pie_data = v;
    double submissions = pie_data.count * 1.0;
    double percentage = (submissions / totalSubbmissions) * 100.0;
    total+=percentage;
    if (percentage > 0) {
      PieChartSectionData pieChartSectionData = PieChartSectionData(
        title: getTitleOfPortion(percentage: percentage, verdict: verdict,count: pie_data.count),
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
    {required String verdict, required double percentage,required count}) {
  return percentage >= 5
      ? "${count}"
      : "";
}



List<Widget> getSectionIndectors_tags(
    {required Map<String, PiChartData_rating> tagsMap,
    required BuildContext context,
    required double totalSubbmissions}) {
  List<Widget> indecators = [];
  var provider=Provider.of<Tags_by_rating_Provider>(context,listen: true);
  List<Container> indecatorsRow =
      _indecatorsInRow(tagsMap: tagsMap,context: context,totalSubbmissions: totalSubbmissions);
  for (int i = 0; i < indecatorsRow.length; i = i + 4) {
    List<GestureDetector> fourSizedRow = [];
    for (int j = i; (j < i + 4) && (j < indecatorsRow.length); j++) {
      fourSizedRow.add(GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5),
          child: indecatorsRow[j],
        ),
        onTapUp: (_) {
          provider.touchedIndex=j;
        },
        onTapDown: (_) {
          provider.touchedIndex=-1;
        },
      ));
    }
    indecators.add(Column(children: fourSizedRow));
  }
  return indecators;
}

List<Container> _indecatorsInRow(
    {required Map<String, PiChartData_rating> tagsMap,
    required BuildContext context,
    required double totalSubbmissions,}) {
  var provider=Provider.of<Tags_by_rating_Provider>(context,listen: true);
  int index=provider.touchedIndex;
  List<Container> indecatorsRow = [];
  int index_iterator = 0;
  tagsMap.forEach(
    (tag, pie_data) {
      double submissions = pie_data.count * 1.0;
      double percentage = (submissions / totalSubbmissions) * 100.0;
      percentage = double.parse(percentage.toStringAsFixed(2));
      if (percentage > 0) {
        Row rowData = Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
              width: 220,
              child: Row(children: [
                Container(
                  width: 160,
                  child: Text(
                    "$tag",
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
                    "${pie_data.count}",
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

        indecatorsRow.add(Container(width: 250, child: rowData));
        index_iterator++;
      }
    },
  );
  return indecatorsRow;
}
