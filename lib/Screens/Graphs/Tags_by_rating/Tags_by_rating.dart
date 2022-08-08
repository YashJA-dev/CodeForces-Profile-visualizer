import 'package:flutter/material.dart';
import '/Model/Problems.dart';

import 'Tags_by_rating_body/Tags_by_ratingBody.dart';

class Tags_by_rating extends StatelessWidget {
  ProblemData problemData;
  Tags_by_rating({required this.problemData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tags Solved Between Rating",
        ),
        centerTitle: true,
      ),
      body: Tags_by_ratingBody(problemData: problemData),
    );
  }
}