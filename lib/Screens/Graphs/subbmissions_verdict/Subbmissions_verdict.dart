import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'package:wp_visualizer/Model/Problems.dart';
import 'package:wp_visualizer/Screens/Graphs/subbmissions_verdict/subbmissions_verdictBody.dart';

class Subbmissions_verdict extends StatelessWidget {
  ProblemData problemData;
  Subbmissions_verdict({required this.problemData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Subbmisiions Verdicts")),
      body: Subbmissions_verdictBody(problemData: problemData),
    );
  }
}