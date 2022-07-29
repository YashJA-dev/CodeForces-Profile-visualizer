import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/BlogsInfo.dart';
import 'package:wp_visualizer/Screens/Blogs/blogsListHolder/BlogsList.dart';

import 'NoblogWritten/NoBlogs_written.dart';

class Blogs_screen extends StatelessWidget {
  BlogsInfo blogsInfo;
  
  Blogs_screen({required this.blogsInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Blogs Written",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildBlogsList(blogsInfo),
    );
  }

  Widget buildBlogsList(BlogsInfo blogsInfo) {
    String status = blogsInfo.status;
    if(status=="OK"){
      return BlogsListBuilder(blogDataList: blogsInfo.blogDataList,);
    }else{
      return NoBlogs_Written();
    }
  }
}
