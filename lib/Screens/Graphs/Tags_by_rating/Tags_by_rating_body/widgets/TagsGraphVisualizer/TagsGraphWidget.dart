import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Model/Problems.dart';
import 'package:wp_visualizer/Screens/Graphs/Tags_by_rating/Tags_by_rating_body/widgets/TagsGraphVisualizer/DefaultHolder_Tags_Graph.dart';

import '../../../../../../Controller/Fetching Api/problems_Fetcher.dart';
import '../../../../../../Providers/Problems_in_Range.dart';
import '../../../../../../Providers/TagsByRating_Provider.dart';
import 'TagsGraphVisualizer.dart';

class TagsGraphWidget extends StatelessWidget {
  ProblemData problemData;
  TagsGraphWidget({required this.problemData});
  @override
  Widget build(BuildContext context) {
    Tags_by_rating_Provider provider = Provider.of<Tags_by_rating_Provider>(context);
    int rating1 = provider.rating_dropDown1;
    int rating2 = provider.rating_dropDown2;
    int touchedIndex = provider.touchedIndex;

    ProblemsInRange problemsInRange =
        ProblemsInRange(subbmissions_rating: problemData.subbmissions_rating);
    problemsInRange.setTags(start: rating1, end: rating2);
    Map<String, PiChartData_rating> tags_peiData = problemsInRange.getTags;
    int problems = _getTotalTags(tags_peiData);
    return (rating1 <= rating2 && problems > 0)
        ? 
        // ChangeNotifierProvider(
        //     create: (_) => Tags_Index_Provider(),

        //     child: 
            TagsGraphVisualizer(
              problems: problems * 1.0,
              tags_peiData: tags_peiData,
            )
          // ),
        : DefaultHolder_Tags_Graph();
  }

  _getTotalTags(Map<String, PiChartData_rating> tags) {
    int problems = 0;
    tags.forEach((key, value) {
      problems += value.count;
    });
    return problems;
  }
}
