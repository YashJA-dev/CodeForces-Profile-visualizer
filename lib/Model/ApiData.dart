import 'package:wp_visualizer/Model/BlogsInfo.dart';
import 'package:wp_visualizer/Model/ContestInfo.dart';
import 'package:wp_visualizer/Model/Problems.dart';
import 'package:wp_visualizer/Model/UserData.dart';

class ApiData {
  late UserData _userData;
  late ProblemData _problemData;
  late BlogsInfo _blogsInfo;
  late ContestInfo _contestInfo;

  ApiData({
    required UserData userData,
    required ProblemData problemData,
    required BlogsInfo blogsInfo,
    required ContestInfo contestInfo,
  })  : _problemData = problemData,
        _userData = userData,
        _blogsInfo=blogsInfo,
        _contestInfo=contestInfo;
  get getBlogsInfo => this._blogsInfo;

  get getContestInfo => this._contestInfo;

  get userData => this._userData;

  get problemData => this._problemData;
}
