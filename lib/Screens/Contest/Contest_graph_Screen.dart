import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wp_visualizer/Model/ApiData.dart';

import 'ContestBuilder/contest_listBuilder.dart';

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
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
            ),
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
