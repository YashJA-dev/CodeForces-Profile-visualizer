import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/ApiData.dart';

import 'ContestBuilder/contest_listBuilder.dart';
import 'GraphHolderBuilder.dart';

class Contest_Graph_screen extends StatelessWidget {
  ApiData apiData;
  Contest_Graph_screen({required this.apiData});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: GraphHolderBuilder(apiData: apiData),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: ContestListBuilder(
              contestInfo: apiData.getContestInfo,
            ),
          ),
        ],
      ),
    );
  }

}
