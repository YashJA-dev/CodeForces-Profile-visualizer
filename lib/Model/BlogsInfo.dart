import '/Controller/DateConverter.dart';

class BlogsInfo {
  late String? _status;
  late List<BlogData>? _blogDataList;
  BlogsInfo.verdict({required String status}):_status=status;
  BlogsInfo({
    required String status,
    required List<BlogData> blogDataList,
  })  : _blogDataList = List.from(blogDataList),
        _status = status;
  get status => this._status;

  get blogDataList => this._blogDataList;
}

class BlogData {
  DateTime? _creationTime;
  int? _rating;
  int? _id;
  String? _title;
  DateTime? _modifiactionTime;

  BlogData({
    required int creationTime,
    required int rating,
    required int id,
    required String title,
    required int modifiactionTime,
  })  : _creationTime = DateConverter.toDateTime(creationTime),
        _modifiactionTime = DateConverter.toDateTime(modifiactionTime),
        _id = id,
        _title = title,
        _rating = rating;

  get creationTime => this._creationTime;

  get rating => this._rating;

  get id => this._id;

  get title => this._title;

  get modifiactionTime => this._modifiactionTime;
}
