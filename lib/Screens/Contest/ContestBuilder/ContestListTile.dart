import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wp_visualizer/Model/BlogsInfo.dart';
import 'package:wp_visualizer/Screens/Blogs/blogsListHolder/Openblog.dart';
import '/Colors/ColorDecider.dart';
import '/Model/ContestInfo.dart';
import 'contestStandingOpener.dart';

class ListTileBuilder extends StatelessWidget {
  ContestData contestData;
  ListTileBuilder({required this.contestData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(10),
        title: ListTile(
          leading: getLeading(contestData),
          title: Text(contestData.contestName,textAlign: TextAlign.center,)
        ),
        children: expandedList(contestData),
      ),
    );
  }

  Widget getLeading(ContestData contestData) {
    int difference_in_rating = contestData.newRating - contestData.oldRating;
    List<Widget> leading = [];
    if (difference_in_rating > 0) {
      leading.add(formImage("images/up.png"));
      leading.add(
        Text(
          "${difference_in_rating}",
          style: TextStyle(color: Colors.green),
        ),
      );
    } else if (difference_in_rating < 0) {
      leading.add(formImage("images/down.png"));
      leading.add(
        Text(
          "${difference_in_rating}",
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      leading.add(
        Container(
          height: 50,
          width: 50,
          child: Icon(Icons.exposure_zero),
        ),
      );
    }
    return leading.length == 2
        ? Column(children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: leading[0],
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: leading[1],
            ),
          ])
        : leading[0];
  }

  Container formImage(String url) {
    return Container(
      height: 50,
      width: 50,
      child: FittedBox(
        alignment: Alignment.center,
        child: Image.asset(url),
      ),
    );
  }

  List<Widget> expandedList(ContestData contestData) {
    var firstItem=Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Rank : ",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  "${contestData.rank}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "${contestData.oldRating}",
                style: TextStyle(
                    color:
                        ColorDecider.fromRating(rating: contestData.oldRating)
                            .decideByRating(),
                            fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_right_outlined),
              Text(
                "${contestData.newRating}",
                style: TextStyle(
                    color:
                        ColorDecider.fromRating(rating: contestData.newRating)
                            .decideByRating(),
                            fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      );
    
    return [
      firstItem,
      ContestStanding_Opener(contestData: contestData,),
      // OpenBlog(blogData: BlogData(creationTime: 111111111,id: 1,modifiactionTime: 22222,rating: 12,title: "fdfd")),
    ];
  }
}
