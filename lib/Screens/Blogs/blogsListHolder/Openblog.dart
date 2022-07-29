import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wp_visualizer/Model/BlogsInfo.dart';

class OpenBlog extends StatelessWidget {
  BlogData blogData;
  OpenBlog({required this.blogData});
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: TextButton(
          child: Text(
            "Read Blog",
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => urlButtonPress(blogData)),
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

  urlButtonPress(BlogData blogData) {
    _launchURL(uri: "https://codeforces.com/blog/entry/${blogData.id}");
  }
}
