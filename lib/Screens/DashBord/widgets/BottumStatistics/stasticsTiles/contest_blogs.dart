import 'package:flutter/material.dart';
import '/Model/ContestInfo.dart';
import '../../../../../Model/BlogsInfo.dart';
import '/Model/ApiData.dart';

class Contest_blogs extends StatelessWidget {
  double height;
  ApiData apiData;
  Contest_blogs({required this.height,required this.apiData});
  @override
  Widget build(BuildContext context) {
    BlogsInfo blogsInfo=apiData.getBlogsInfo;
    ContestInfo contestInfo=apiData.getContestInfo;
    UtilContest utilContest=contestInfo.utilContest;
    int blogs=0;
    if(blogsInfo.status=="OK"){
      blogs=blogsInfo.blogDataList.length;
    }
    
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   rowText(
                    first: "Max Ups",

                    sec: "${utilContest.getMaxUp}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.green, 
                    height: height*0.03,
                    ),
                    rowText(
                    first: "Max Downs",
                    sec: "${utilContest.getMaxDown}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.redAccent, 
                    height: height*0.03,
                    ),
                    rowText(
                    first: "Min Rank",
                    sec: "${utilContest.getMinRank}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.green, 
                    height: height*0.03,

                    ),
                    rowText(
                    first: "Total Blogs Written",
                    sec: "${blogs}",
                    firstTextColor: Colors.black,
                    SecTextColor: Colors.blueGrey, 
                    height: height*0.03,
                    )
                   
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(flex: 5,fit: FlexFit.tight,child: Image.asset("images/contest.jpg",fit:BoxFit.cover)),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: FittedBox(
                      child: Text(
                        "Total Contests",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: FittedBox(
                      child: Text(
                        "Participated",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: FittedBox(
                      child: Text(
                        "${contestInfo.contestDataList.length}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible rowText({
    required String first,
    required String sec,
    required Color firstTextColor,
    required Color SecTextColor,
    required double height,
  }) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Row(
        children: [
          Flexible(
            flex: 0,
            child: Text(
              "$first ",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: firstTextColor,
                fontSize: height,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              sec,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: SecTextColor,
                fontSize: height,
              ),
            ),
          )
        ],
      ),
    );
  }
}
