import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Colors/ColorDecider.dart';
import 'package:wp_visualizer/Model/Problems.dart';

import '../Controller/Fetching Api/problems_Fetcher.dart';

class ProblemsInRange extends ChangeNotifier{
  Map<int, Map<String, int>> _subbmissions_rating;
  ProblemsInRange({required Map<int, Map<String, int>> subbmissions_rating})
      : _subbmissions_rating = subbmissions_rating;

  List<Color> _colors_list = ColorDecider().colors_list;
  Map<String, PiChartData_rating> tags_peiData =
      new Map<String, PiChartData_rating>();

  Map<String, PiChartData_rating> setTags({int start = 0, int end = 5000}) {
    tags_peiData = new Map<String, PiChartData_rating>();
    int _colour_index_tags = 0;
    _subbmissions_rating.forEach((key, value) {
      if (key >= start && key <= end) {
        Map<String, int> tags = value;
        tags.forEach((tag, ocurence) {
          if (tags_peiData[tag] == null) {
            tags_peiData[tag] = PiChartData_rating(
              color: _colors_list[_colour_index_tags % _colors_list.length],
              count: ocurence,
            );
            _colour_index_tags++;
          } else {
            tags_peiData[tag]!.increaseCount(inc: ocurence);
          }
        });
      }
    });

    return tags_peiData;
  }

  get getTags => this.tags_peiData;
}
