import 'dart:convert';

import '/Model/BlogsInfo.dart';

import '../../Model/ContestInfo.dart';
import '../Api.dart';
import 'package:http/http.dart' as http;

class BlogsInfoFetcher{
  late String handle;
  late Api api;
  BlogsInfoFetcher({required String handle}){
    this.handle=handle;
    api=Api(handle: handle);
  }
  Future<BlogsInfo> blogsFetch()async {
    Uri url=Uri.parse(api.totalBlogsApi());
    var response=await http.get(url);
    var decodedResonse=jsonDecode(response.body);
    String status=decodedResonse["status"];
    if(status!="OK"){
      return BlogsInfo.verdict(status: status);
    }else{
      List<BlogData> blogsDataList=[];
      var blogs=decodedResonse["result"];
      for(var blog in blogs){
        int creationTime=blog["creationTimeSeconds"];
        int id=blog["id"];
        int modifiactionTime=blog["modificationTimeSeconds"];
        int rating=blog["rating"];
        String title=blog["title"];
        BlogData blogData=BlogData(
          creationTime: creationTime,
          id: id,
          modifiactionTime: modifiactionTime,
          rating: rating,
          title: title);
        blogsDataList.add(blogData);
      }
      return BlogsInfo(status: status,blogDataList: blogsDataList);
    }
  }
}
