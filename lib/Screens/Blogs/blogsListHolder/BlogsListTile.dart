import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:wp_visualizer/Model/BlogsInfo.dart';
import 'package:wp_visualizer/Screens/Blogs/blogsListHolder/Openblog.dart';

class BlogsListTile extends StatelessWidget {
  BlogData blogData;
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  BlogsListTile({required this.blogData});
  @override
  Widget build(BuildContext context) {
    String title=blogData.title.replaceAll(exp, ' ');
    String createdBlogDate=DateFormat()
        .addPattern("yMMMd")
        .format(blogData.creationTime)
        .toString();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ExpansionTile(
        title: ListTile(
          leading: _getLeading(blogData.rating),
          title: Text(title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,),
          subtitle: Text(createdBlogDate,textAlign: TextAlign.center,),    
        ),
        children: [
            OpenBlog(blogData: blogData,),
        ],
      ),

    );
  }

  Column _getLeading(int rating) {
    var leadingItems = [];
    if (rating == 0) {
      leadingItems.add(FittedBox(child: Image.asset("images/none.png")));
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.exposure_zero),
        ],
      );
    } else if (rating > 0) {
      leadingItems.add(Image.asset("images/up.png"));
      leadingItems.add(
        Text("$rating", style: TextStyle(color: Colors.green),textAlign: TextAlign.center,),
      );
    } else {
      leadingItems.add(Image.asset("images/down.png"));
      leadingItems.add(
        Text("$rating", style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
      );
    }
    return Column(children: [
      Flexible(flex: 2, child: leadingItems[0]),
      Flexible(child: leadingItems[1])
    ]);
  }
}
