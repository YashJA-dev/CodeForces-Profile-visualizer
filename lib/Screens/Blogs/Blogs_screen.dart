import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/BlogsInfo.dart';
import 'package:wp_visualizer/Screens/Blogs/blogsListHolder/BlogsList.dart';

import 'NoblogWritten/NoBlogs_written.dart';

class Blogs_screen extends StatelessWidget {
  BlogsInfo blogsInfo;

  Blogs_screen({required this.blogsInfo});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    height -= (150);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 90,
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              "Blogs Written",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          // flex: 0,
          child: buildBlogsList(blogsInfo),
        ),
      ],
    );
  }

  Widget buildBlogsList(BlogsInfo blogsInfo) {
    String status = blogsInfo.status;
    if (status == "OK"&&blogsInfo.blogDataList.length>0) {
      return BlogsListBuilder(
        blogDataList: blogsInfo.blogDataList,
      );
    } else {
      return NoBlogs_Written();
    }
  }
}
