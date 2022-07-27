import 'package:wp_visualizer/Controller/Fetching%20Api/ContestInfo_Fetcher.dart';

class ContestInfo {
  late String? _status;
  late UtilContest _utilContest;
  late List<ContestData>? _contestDataList;

  ContestInfo.verdict({
    required String status,
  }) : _status = status;
  ContestInfo({
    required String status,
    required List<ContestData> contestDataList,
    required UtilContest utilContest,
  })  : _contestDataList = List.from(contestDataList),
        _status = status,
        _utilContest = utilContest;
  get status => this._status;

  get utilContest => this._utilContest;

  get contestDataList => this._contestDataList;
}

class ContestData {
  int? _contestId;
  String? _contestName;
  String? _handle;
  int? _rank;
  int? _oldRating;
  int? _newRating;

  ContestData({
    required int contestId,
    required String contestName,
    required String handle,
    required int rank,
    required int oldRating,
    required int newRating,
  })  : _contestId = contestId,
        _contestName = contestName,
        _handle = handle,
        _rank = rank,
        _oldRating = oldRating,
        _newRating = newRating;
  get contestId => this._contestId;

  get contestName => this._contestName;

  get handle => this._handle;

  get rank => this._rank;

  get oldRating => this._oldRating;

  get newRating => this._newRating;
}
class UtilContest {
  int maxUp = 0;
  int maxDown = 0;
  int minRank = 0;
  int maxRank = 0;

  UtilContest({
    this.maxUp = 0,
    this.maxDown = 0,
    this.minRank = -1,
    this.maxRank = -1,
  });
  get getMaxUp => this.maxUp;


  get getMaxDown => this.maxDown;


  get getMinRank => this.minRank;


  get getMaxRank => this.maxRank;
}