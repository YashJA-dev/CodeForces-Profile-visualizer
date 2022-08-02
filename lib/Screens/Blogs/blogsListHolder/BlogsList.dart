import 'package:flutter/material.dart';
import '../../../Model/BlogsInfo.dart';
import 'BlogsListTile.dart';

class BlogsListBuilder extends StatelessWidget {
  List<BlogData> blogDataList;
  BlogsListBuilder({required this.blogDataList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: blogDataList.length,
      itemBuilder: (context, index) {
        return BlogsListTile(
          blogData: blogDataList[index],
        );
      },
    );
  }
}
