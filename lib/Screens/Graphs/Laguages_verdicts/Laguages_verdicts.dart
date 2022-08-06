import 'package:flutter/material.dart';
import 'package:wp_visualizer/Controller/Api.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'package:wp_visualizer/Model/Problems.dart';

import 'LanguageVerdictsBody.dart';

class Laguages_verdicts extends StatelessWidget {
  ProblemData problemData;
  Laguages_verdicts({required this.problemData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Language Verdicts")),
      body: LanguageVerdictsBody(problemData :problemData),
    );
  }
}
