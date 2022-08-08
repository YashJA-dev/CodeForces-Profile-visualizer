import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../Colors/ColorDecider.dart';
import '../../../../../Model/UserData.dart';

class RankingStatistics extends StatelessWidget {
  double height;
  UserData userData;
  RankingStatistics({required this.height, required this.userData});
  @override
  Widget build(BuildContext context) {
    String registrationDate = DateFormat()
        .addPattern("yMMMd")
        .format(userData.registrationTime)
        .toString();
    Color primaryColor = Theme.of(context).primaryColor;
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    rowText(
                      first: "Rating ",
                      sec: "${userData.rating}",
                      firstTextColor: Colors.black,
                      SecTextColor: primaryColor,
                      height: height * 0.03,
                    ),
                    rowText(
                      first: "Contributions ",
                      sec: "${userData.contribution}",
                      firstTextColor: Colors.black,
                      SecTextColor: userData.contribution < 0
                          ? Color.fromARGB(255, 243, 6, 6)
                          : Colors.green,
                      height: height * 0.03,
                    ),
                    rowText(
                      first: "Friends of ",
                      sec: "${userData.friendOfCount}",
                      firstTextColor: Colors.black,
                      SecTextColor: Colors.green,
                      height: height * 0.03,
                    ),
                    rowText(
                      first: "Regestered ",
                      sec: "${registrationDate} ",
                      firstTextColor: Colors.black,
                      SecTextColor: Colors.green,
                      height: height * 0.03,
                    ),
                    rowText(
                      first: "Org.. ",
                      sec: "${userData.organization} ",
                      firstTextColor: Colors.black,
                      SecTextColor: Colors.green,
                      height: height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Flexible(
                        flex: 3,
                      fit: FlexFit.tight,
                        child: Image.asset(
                          "images/chart-going-up.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: FittedBox(
                        child: Text(
                          "Maximum Rating ",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          "${userData.maxRank} \n ( ${userData.maxRating} )",
                          style: TextStyle(
                            color: ColorDecider.fromRank(rank: userData.maxRank)
                                .getPrimaryColor(),
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.03,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
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
