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
    var data = jsonDecode(response.body)["result"][0];
    /*
    loading data inside the modle
    */
    UserData userData = new UserData(
        lastOnline: data["lastOnlineTimeSeconds"],
        rating: data["rating"],
        friendOfCount: data["friendOfCount"],
        titlePhoto: data["titlePhoto"],
        handle: data["handle"],
        avatar: data["avatar"],
        contribution: data["contribution"],
        rank: data["rank"],
        maxRating: data["maxRating"],
        maxRank: data["maxRank"],
        registrationTime: data["registrationTimeSeconds"]);

    return userData;
  }
}
