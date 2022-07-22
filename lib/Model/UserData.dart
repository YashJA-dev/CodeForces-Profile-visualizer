import 'dart:ffi';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class UserData {
    
  String? _lastOnline=null;
  int? _rating=null;
  int? _friendOfCount=null;
  String? _titlePhoto=null;
  String? _handle=null;
  String? _avatar=null;
  int? _contribution=null;
  String? _rank=null;
  int? _maxRating=null;
  DateTime? _registrationTime=null;
  String? _maxRank=null;
  String? _status=null;
  DateTime timeNow=DateTime.now();
  UserData.status({required String status}):_status=status;
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
      required String status,

      required int registrationTime})
      : _avatar = avatar,
        _contribution = contribution,
        _friendOfCount = friendOfCount,
        _handle = handle,
        _lastOnline =convertToDateTime(lastOnline),
        _maxRating = maxRating,
        _rank = rank,
        _maxRank = maxRank,
        _registrationTime =
            DateTime.fromMillisecondsSinceEpoch(registrationTime * 1000),
        _titlePhoto = titlePhoto,
        _rating = rating,
        _status=status;

        
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
  get status=> this._status;
  
  static String convertToDateTime(int lastOnline) {
    DateTime online=DateTime.fromMillisecondsSinceEpoch(lastOnline * 1000);
    DateTime timeNow=DateTime.now();
    Duration duration=timeNow.difference(online);
    if(duration.inSeconds<60)return "Online";
    else if(duration.inMinutes<60)return "${duration.inMinutes} Minutes Ago.";
    else if(duration.inHours<24)return "${duration.inHours} Hours Ago.";
    else{
      int hours=duration.inHours;
      int days=hours~/24;
      if(days<30){
        int hourDay=hours%24;
        if(hourDay>0)return "${days} Days ${hourDay} Hours ago";
        else return "${days} Days Ago";
      }else{
        int months=days~/30;
        days=days%30;
        if(days==0)return ("$months Ago ");
        else if(months<=12){
          return("$months Months $days Days Ago ");
        }else{
          int yrs=months~/12;
          months=months%12;
          if(months==0)return ("$yrs Years Ago");
          else return ("$yrs Years $months Moths Ago");
        }
      }
       
    }
  }
  
}
