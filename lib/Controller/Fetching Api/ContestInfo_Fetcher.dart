import 'dart:convert';
import 'dart:math';

import '../../Model/ContestInfo.dart';
import '../Api.dart';
import 'package:http/http.dart' as http;

class ContestInfoFetcher {
  late String handle;
  late Api api;
  ContestInfoFetcher({required String handle}) {
    this.handle = handle;
    api = Api(handle: handle);
  }
  Future<ContestInfo> contestFetch() async {
    Uri url = Uri.parse(api.cntestInfoAPI());
    var response = await http.get(url);
    var decodedResonse = jsonDecode(response.body);
    String status = decodedResonse["status"];
    if (status != "OK") {
      return ContestInfo.verdict(status: status);
    } else {
      List<ContestData> contestsDataList = [];
      var contests = decodedResonse["result"];
      int maxUp = 0;
      int maxDown = 0;
      int minRank = 1000000;
      int maxRank = 0;
      for (var contest in contests) {
        int contestId = contest["contestId"];
        String contestName = contest["contestName"];
        int rank = contest["rank"];
        int oldRating = contest["oldRating"];
        int newRating = contest["newRating"];
        maxUp = max(newRating - oldRating, maxUp);
        maxDown = min(newRating - oldRating, maxDown);
        minRank = min(minRank, rank);
        maxRank = max(maxRank, rank);
        ContestData contestData = ContestData(
            contestId: contestId,
            contestName: contestName,
            handle: handle,
            rank: rank,
            oldRating: oldRating,
            newRating: newRating);
        contestsDataList.add(contestData);
      }
      UtilContest utilContest = UtilContest(
        maxDown: maxDown,
        maxUp: maxUp,
        maxRank: maxRank,
        minRank: minRank,
      );
      return ContestInfo(
        status: status,
        contestDataList: contestsDataList,
        utilContest: utilContest,
      );
    }
  }
}


