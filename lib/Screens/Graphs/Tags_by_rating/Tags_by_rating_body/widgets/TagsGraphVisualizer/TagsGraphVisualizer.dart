import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Providers/TagsByRating_Provider.dart';

import '../../../../../../Controller/Fetching Api/problems_Fetcher.dart';

import 'TagSection_Indecator/tags_sections_indecators.dart';

class TagsGraphVisualizer extends StatelessWidget {
  Map<String, PiChartData_rating> tags_peiData;
  double problems;
  TagsGraphVisualizer({required this.tags_peiData, required this.problems});
  @override
  Widget build(BuildContext context) {
    Tags_by_rating_Provider provider =
        Provider.of<Tags_by_rating_Provider>(context);
    return Column(
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
                  provider.touchedIndex = -1;
                } else {
                  provider.touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                }
              }),
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              sections: getTags_Sections(
                  context: context,
                  tagsMap: tags_peiData,
                  totalSubbmissions: problems),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getSectionIndectors_tags(
                  tagsMap: tags_peiData,
                  context: context,
                  totalSubbmissions: problems),
            ),
          ),
        ),
      ],
    );
  }
}
