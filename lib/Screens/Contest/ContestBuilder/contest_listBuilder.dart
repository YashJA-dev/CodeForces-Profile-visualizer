
import '../NotGivenAnyContest.dart';
import '/Model/ContestInfo.dart';
import 'ContestListTile.dart';
import 'package:flutter/material.dart';

class ContestListBuilder extends StatelessWidget {
  ContestInfo contestInfo;
  ContestListBuilder({required this.contestInfo});
  @override
  Widget build(BuildContext context) {
    List<ContestData> contestList=contestInfo.contestDataList;
    int length=contestList.length;
    return length!=0?ListView.builder(
      itemCount: length,
      reverse: false,
      itemBuilder: ((context, index) {
        return ListTileBuilder(contestData: contestList[length-index-1],);
      }),
    ):NotGivenAnyContest();
  }
}
