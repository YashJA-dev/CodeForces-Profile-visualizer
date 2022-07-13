import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wp_visualizer/Fetching%20API/Exceptions/cf_user_info_exception.dart';

class CfUserInfoProvider {
  Future<void> fetchUserInfo(String userHandle) async {
    String userInfoApiURL =
        'https://codeforces.com/api/user.info?handles=$userHandle';

    Uri url = Uri.parse(
      userInfoApiURL,
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
    } else {
      throw CfUserInfoFetchingFailed();
    }
    log(jsonDecode(response.body).toString());
  }
}

// class CfUserInfoResponse {
//   String status;
//   String? comment;
//   final CfUserInfo? cfUserInfo;

//   CfUserInfoResponse({
//     required this.status,
//     this.comment,
//     this.cfUserInfo,
//   });

//   // CfUserInfoResponse.fromJson(Map<String, dynamic> json) {
//   //   status = json['status'];
//   //   if (json.containsKey('comment')) {
//   //     comment = json['comment'];
//   //   }
//   //   if (json.containsKey('result')) {}
//   // }
// }

// class CfUserInfo {
//   String? handle;
//   String? email;
//   String? lastName;
//   int? lastOnlineTimeSeconds;
//   int? rating;
//   int? friendOfCount;
//   String? titlePhoto;
//   String? avatar;
//   String? firstName;
//   int? contribution;
//   String? organization;
//   String? rank;
//   int? maxRating;
//   int? registrationTimeSeconds;
//   String? maxRank;
//   String? country;
//   String? city;
// }
