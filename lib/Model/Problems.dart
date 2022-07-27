import '../Controller/DateConverter.dart';

class ProblemData {
  String? _status = null;
  List<ProblemsInfo> _result = [];
  Map<String, List<ProblemsInfo>> _list_verdict=new Map<String, List<ProblemsInfo>>();
  ProblemData.verdict({required String status}) : _status = status;
  ProblemData({
    required String status,
    required List<ProblemsInfo> result,
    required Map<String, List<ProblemsInfo>> list_verdict,
  })  : _status = status,
        _result = List.from(result),
        _list_verdict = Map.from(list_verdict);

  get status => this._status;
  Map<String, List<ProblemsInfo>> getVerdictList(){
    return _list_verdict;
  }
  get getResult => this._result;
}

class ProblemsInfo {
  int? _contestId;
  DateTime? _creationTime;
  DateTime? _relativeTime;
  Problem? _problem;
  String? _programingLanguage;
  String? _verdict;
  int? _passedTestCount;
  int? get contestId => this._contestId;

  get creationTime => this._creationTime;

  get relativeTime => this._relativeTime;

  get problem => this._problem;

  get programingLanguage => this._programingLanguage;

  get verdict => this._verdict;

  get passedTestCount => this._passedTestCount;

  ProblemsInfo({
    required int contestId,
    required int creationTime,
    required int relativeTime,
    required String programingLanguage,
    required String verdict,
    required Problem problem,
    required int passedTestCount,
  })  : _contestId = contestId,
        _relativeTime = DateConverter.toDateTime(relativeTime),
        _creationTime = DateConverter.toDateTime(creationTime),
        _programingLanguage = programingLanguage,
        _verdict = verdict,
        _passedTestCount = passedTestCount,
        _problem = problem;
}

class Problem {
  int? _contestId;
  String? _index;
  String? _name;
  String? _type;
  int? _rating;

  List<String> _tags = [];
  Problem({
    required int contestId,
    required String index,
    required String name,
    required String type,
    required int rating,
    required List<String> tags,
  })  : _contestId = contestId,
        _index = index,
        _name = name,
        _type = type,
        _rating = rating,
        _tags = List.from(tags);
  get index => this._index;

  get name => this._name;

  get type => this._type;

  get rating => this._rating;
}
