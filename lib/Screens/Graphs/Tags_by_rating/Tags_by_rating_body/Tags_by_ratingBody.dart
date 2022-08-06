import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Controller/Fetching%20Api/problems_Fetcher.dart';
import 'package:wp_visualizer/Model/Problems.dart';

import '../../../../Controller/GraphsInfo/Problems_in_Range.dart';
import '../../../../Providers/TagsByRating_Provider.dart';
import 'widgets/Rating_selectorWidget.dart';

class Tags_by_ratingBody extends StatefulWidget {
  ProblemData problemData;
  late ProblemsInRange problemsInRange;

  Tags_by_ratingBody({required this.problemData}) {
    problemsInRange =
        ProblemsInRange(subbmissions_rating: problemData.subbmissions_rating);
  }
  @override
  State<Tags_by_ratingBody> createState() => _Tags_by_ratingBodyState();
}

class _Tags_by_ratingBodyState extends State<Tags_by_ratingBody> {
  late Map<String, PiChartData_rating> tagsData;
  Map<int, Map<String, int>>? subbmissions_rating;

  @override
  Widget build(BuildContext context) {
    ProblemData problemData = widget.problemData;
    subbmissions_rating = problemData.subbmissions_rating;
    tagsData = widget.problemsInRange.getTags();
    double ProblemCount = problemData.getResult.length * 1.0;
    var mediaQuery = MediaQuery.of(context);
    double height = (mediaQuery.size.height) -
        AppBar().preferredSize.height -
        mediaQuery.viewPadding.top;
    double width = mediaQuery.size.width;
    return ChangeNotifierProvider(
        create:(_)=>Tags_by_rating_Provider(),
        child: Container(
        height: height,
        width: width,
        child:  Column(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
              flex: 1,
              child: Rating_selectorWidget(),  
            ),
            Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.pink),
                )),
          ]),
        ),
    );
  }
}
