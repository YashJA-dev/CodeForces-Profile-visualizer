import 'dart:convert';

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
    List<ProblemsInfo> problemsInfoList=[];
    Map<String,List<ProblemsInfo>> map=new Map<String,List<ProblemsInfo>>();
    if (status != "OK") {
      return ProblemData.verdict(status: status);
    } else {
      for (var objectResult in resultJson) {
        var problem = objectResult["problem"];
        List<String> tagsOfProblem = [];
        for (String tag in problem["tags"]) {
          tagsOfProblem.add(tag);
        }

        Problem StoreProblem=Problem(
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
        String verdict=problemsInfo.verdict;
        if(!map.containsKey(verdict)){
          List<ProblemsInfo> newList=[];
          map.putIfAbsent(verdict, () {
            return newList;
          });
          print(verdict);
        }else{
          List<ProblemsInfo>? newList=map[verdict];
          newList?.add(problemsInfo);
        }
        problemsInfoList.add(problemsInfo);
      }
    }
    return ProblemData(status: status, result: problemsInfoList,list_verdict: map)  ;
  }
}
