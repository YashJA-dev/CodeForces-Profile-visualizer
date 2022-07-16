import 'dart:ffi';

class UserData {
  DateTime _lastOnline;
  int _rating;
  int _friendOfCount;
  String _titlePhoto;
  String _handle;
  String _avatar;
  int _contribution;
  String _rank;
  int _maxRating;
  DateTime _registrationTime;
  String _maxRank;

  UserData(
      {
      required int lastOnline,
      required int rating,
      required int friendOfCount,
      required String titlePhoto,
      required String handle,
      required String avatar,
      required int contribution,
      required String rank,
      required int maxRating,
      required String maxRank,
      required int registrationTime})
      : _avatar = avatar,
        _contribution = contribution,
        _friendOfCount = friendOfCount,
        _handle = handle,
        _lastOnline = DateTime.fromMillisecondsSinceEpoch(lastOnline * 1000),
        _maxRating = maxRating,
        _rank = rank,
        _maxRank = maxRank,
        _registrationTime =
            DateTime.fromMillisecondsSinceEpoch(registrationTime * 1000),
        _titlePhoto = titlePhoto,
        _rating = rating;


        
  get lastOnline => this._lastOnline;


  get rating => this._rating;

  get friendOfCount => this._friendOfCount;

  get titlePhoto => this._titlePhoto;

  get handle => this._handle;

  get avatar => this._avatar;

  get contribution => this._contribution;

  get rank => this._rank;

  get maxRating => this._maxRating;

  get registrationTime => this._registrationTime;
  

  get maxRank => this._maxRank;

  set maxRank(value) => this._maxRank = value;
}
