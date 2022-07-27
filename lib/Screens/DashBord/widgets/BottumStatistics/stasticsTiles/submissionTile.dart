import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/Problems.dart';

class SubmissionTile extends StatelessWidget {
  ProblemData problemsData;
  double height;
  late Map<String,List<ProblemsInfo>> verdictList;
  SubmissionTile({required this.problemsData, required this.height});
  @override
  Widget build(BuildContext context) {
   verdictList=problemsData.getVerdictList();
   int? OK=verdictList["OK"]?.length;
   int? WRONG_ANSWER=verdictList["WRONG_ANSWER"]?.length;
   int? RUNTIME_ERROR=verdictList["RUNTIME_ERROR"]?.length;
   int? TIME_LIMIT_EXCEEDED=verdictList["TIME_LIMIT_EXCEEDED"]?.length;
   int? SKIPPED=verdictList["SKIPPED"]?.length;
   int? PARTIAL=verdictList["PARTIAL"]?.length;
   int? MEMORY_LIMIT_EXCEEDED=verdictList["MEMORY_LIMIT_EXCEEDED"]?.length;
   int? COMPILATION_ERROR=verdictList["COMPILATION_ERROR"]?.length;
   int? IDLENESS_LIMIT_EXCEEDED=verdictList["IDLENESS_LIMIT_EXCEEDED"]?.length;
   int? CHALLENGED=verdictList["CHALLENGED"]?.length;
   int? PRESENTATION_ERROR=verdictList["PRESENTATION_ERROR"]?.length;
   
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   rowText(
                    first: "Accepted ",
                    sec: "${OK==null?0:OK}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.green,
                    height: height * 0.03,
                  ),
                  rowText(
                    first: "Wrong Answer ",
                    sec: "${WRONG_ANSWER!=null?WRONG_ANSWER:0}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.red,
                    height: height * 0.03,
                  ),
                  rowText(
                    first: "Compile Time Err.. ",
                    sec: "${COMPILATION_ERROR!=null?COMPILATION_ERROR:0}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.red,
                    height: height * 0.03,
                  ),
                  rowText(
                    first: "Time Limit Ext.. ",
                    sec: "${TIME_LIMIT_EXCEEDED!=null?TIME_LIMIT_EXCEEDED:0}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.red,
                    height: height * 0.03,
                  ),rowText(
                    first: "Skipped ",
                    sec: "${SKIPPED!=null?SKIPPED:0}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.blueGrey,
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Image.asset("images/problem.png")),
                  Text(
                    "Total Subbmision",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${problemsData.getResult.length}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible rowText({
    required String first,
    required String sec,
    required Color firstTextColor,
    required Color SecTextColor,
    required double height,
  }) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Row(
        children: [
          Flexible(
            flex: 0,
            child: Text(
              "$first ",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: firstTextColor,
                fontSize: height,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              sec,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: SecTextColor,
                fontSize: height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
