import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '/Model/ContestInfo.dart';
import 'ContestListTile.dart';

class ContestListBuilder extends StatelessWidget {
  ContestInfo contestInfo;
  ContestListBuilder({required this.contestInfo});
  @override
  Widget build(BuildContext context) {
    List<ContestData> contestList=contestInfo.contestDataList;
    return ListView.builder(
      itemCount: contestList.length,
      itemBuilder: ((context, index) {
        return ListTileBuilder(contestData: contestList[index],);
      }),
    );
  }
}
