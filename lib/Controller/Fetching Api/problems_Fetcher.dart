import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wp_visualizer/Colors/ColorDecider.dart';

import '/Controller/Api.dart';
import '/Model/Problems.dart';
import 'package:http/http.dart' as http;

class ProblemFetch {
  late String handle;
  late Api api;
  ProblemFetch({required String handle}) {
    this.handle = handle;
    api = Api(handle: handle);
  }

  Future<ProblemData> getProblemsInfo() async {
    Uri url = Uri.parse(
      api.problemInfoApi(),
    );

    final Response = await http.get(url);
    var jsonBody = jsonDecode(Response.body);
    String status = jsonBody["status"];
    var resultJson = jsonBody["result"];
    List<ProblemsInfo> problemsInfoList = [];
    Map<String, PiChartData_rating> verdicts_data_pie =
        new Map<String, PiChartData_rating>();
    Map<String, PiChartData_rating> laguages_data_pie =
        new Map<String, PiChartData_rating>();
    Map<int, Map<String, int>> subbmissions_rating =
        new Map<int, Map<String, int>>();
    if (status != "OK") {
      return ProblemData.verdict(status: status);
    } else {
      int verdictsColorPickerIndex = 0;
      int laguageColorsPickerIndex = 0;
      List<Color> colors_list = ColorDecider().colors_list;
      int noOfColors = colors_list.length;
      for (var objectResult in resultJson) {
        var problem = objectResult["problem"];
        List<String> tagsOfProblem = [];
        int? rating = null;
        for (String tag in problem["tags"]) {
          if (_isNumeric(tag)) rating = int.parse(tag);
          tagsOfProblem.add(tag);
        }
        if (rating != null) {
          subbmissions_rating.putIfAbsent(rating, () => Map<String, int>());
          for (String tag in problem["tags"]) {
            subbmissions_rating[rating]!.putIfAbsent(tag, () => 0);
            int count = subbmissions_rating[rating]![tag]! + 1;
            subbmissions_rating[rating]![tag] = count;
          }
        }

        Problem StoreProblem = Problem(
            contestId: problem["contestId"],
            index: problem["index"],
            name: problem["name"],
            type: problem["type"],
            rating: problem["rating"],
            tags: tagsOfProblem);
        ProblemsInfo problemsInfo = ProblemsInfo(
          contestId: objectResult["id"],
          creationTime: objectResult["creationTimeSeconds"],
          relativeTime: objectResult["relativeTimeSeconds"],
          programingLanguage: objectResult["programmingLanguage"],
          verdict: objectResult["verdict"],
          passedTestCount: objectResult["passedTestCount"],
          problem: StoreProblem,
        );
        String verdict = problemsInfo.verdict;
        if (!verdicts_data_pie.containsKey(verdict)) {
          verdicts_data_pie[verdict] = PiChartData_rating(
              color: colors_list[(verdictsColorPickerIndex++) % noOfColors],
              count: 1);
        } else {
          verdicts_data_pie[verdict]!.increaseCount();
        }
        //laguages_data_pie
        String laguage = problemsInfo.programingLanguage;
        if (!laguages_data_pie.containsKey(laguage)) {
          laguages_data_pie[laguage] = PiChartData_rating(
              color: colors_list[(laguageColorsPickerIndex++) % noOfColors],
              count: 1);
        } else {
          laguages_data_pie[laguage]!.increaseCount();
        }

        problemsInfoList.add(problemsInfo);
      }
    }
    return ProblemData(
      status: status,
      result: problemsInfoList,
      verdicts_data_pie: verdicts_data_pie,
      languages_data_pie: laguages_data_pie,
      subbmissions_rating: subbmissions_rating,
    );
  }

  bool _isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}

class PiChartData_rating {
  int count = 0;
  Color color;
  PiChartData_rating({required this.color, required this.count});
  get getCount => this.count;
  void increaseCount() {
    count++;
  }

  get getColor => this.color;

  set setColor(color) => this.color = color;
}
