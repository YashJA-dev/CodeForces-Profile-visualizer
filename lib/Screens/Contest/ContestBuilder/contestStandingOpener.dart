import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wp_visualizer/Model/ContestInfo.dart';

class ContestStanding_Opener extends StatelessWidget {
  ContestData contestData;
  ContestStanding_Opener({required this.contestData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          child: Text(
            "Show Rating",
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: ()=>urlButtonPress(contestData),
        ),
    );
  }

  _launchURL({required String uri}) async {
    var url = Uri.parse(uri);
    var urllaunchable =
        await canLaunch(uri); //canLaunch is from url_launcher package
    if (urllaunchable) {
      await launch(uri); //launch is from url_launcher package to launch URL
    } else {
      Fluttertoast.showToast(msg: "Server Error");
    }
  }

  urlButtonPress(ContestData contestData) {
    _launchURL(uri: "https://codeforces.com/contest/${contestData.contestId}/standings");
  }
}
