import '../Controller/DateConverter.dart';
import '../Controller/Fetching Api/problems_Fetcher.dart';

class ProblemData {
  String? _status = null;
  List<ProblemsInfo> _result = [];
  //verdict section pie data
  Map<String, PiChartData_rating> _verdicts_data_pie =
      new Map<String, PiChartData_rating>();

  //laguages section pie data
  Map<String, PiChartData_rating> _languages_data_pie =
      new Map<String, PiChartData_rating>();

  Map<int, Map<String, int>> _subbmissions_rating=new  Map<int, Map<String, int>>();


  ProblemData.verdict({required String status}) : _status = status;
  ProblemData({
    required String status,
    required List<ProblemsInfo> result,
    required Map<String, PiChartData_rating> verdicts_data_pie,
    required Map<String, PiChartData_rating> languages_data_pie,
    required Map<int, Map<String, int>> subbmissions_rating,
  })  : _status = status,
        _result = List.from(result),
        _verdicts_data_pie =(verdicts_data_pie),
        _languages_data_pie = (languages_data_pie),
        _subbmissions_rating=(subbmissions_rating);
  get subbmissions_rating => this._subbmissions_rating;
  get status => this._status;
  Map<String, PiChartData_rating> get verdicts_data_pie => this._verdicts_data_pie;
  Map<String, PiChartData_rating> get languages_data_pie => this._languages_data_pie;
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
