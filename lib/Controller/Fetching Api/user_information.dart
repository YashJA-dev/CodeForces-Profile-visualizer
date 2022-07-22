import 'dart:convert';

import 'package:wp_visualizer/Model/UserData.dart';

import '../Api.dart';
import 'package:http/http.dart' as http;

class UserInfo {
  late String handle;
  late Api api;
  UserInfo({required String handle}) {
    this.handle = handle;
    this.api = new Api(handle: this.handle);
  }
  Future<UserData> fetchUserInfo() async {
    Uri url = Uri.parse(
      api.userInfoAPI(),
    );
    final response = await http.get(url);
    var jsonBody=jsonDecode(response.body);
    if(jsonBody["status"]=="FAILED"){
      return UserData.status(status: "FAILED");     
    }
    var data = jsonBody["result"][0];
    /*
    loading data inside the modle
    */
    var rank= data["rank"];
    var maxRating=data["maxRating"];
    var maxRank=data["maxRank"];
    var rating=data["rating"];
    UserData userData = new UserData(
        lastOnline: data["lastOnlineTimeSeconds"],
        rating: rating==null?0:rating,
        friendOfCount: data["friendOfCount"],
        titlePhoto: data["titlePhoto"],
        handle: data["handle"],
        avatar: data["avatar"],
        contribution: data["contribution"],
        rank: rank==null?"Unrated":rank,
        maxRating: maxRating==null?0:maxRating,
        maxRank: maxRank==null?"Unrated":maxRank,
        registrationTime: data["registrationTimeSeconds"],
        status: jsonBody["status"]
        );

    return userData;
  }
}
