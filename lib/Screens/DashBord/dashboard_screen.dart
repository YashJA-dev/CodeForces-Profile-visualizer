import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Colors/ColorDecider.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'package:wp_visualizer/Model/UserData.dart';
import 'package:wp_visualizer/Screens/DashBord/widgets/topBannerWidget.dart';

import '../../Colors/ThemeChange.dart';
import 'widgets/BottumStatistics/BottumStatisticsHolderWidget.dart';

class Dashboard extends StatelessWidget {
  late ApiData apiData;
  late UserData userData;
  Dashboard({required ApiData apiData}){
    this.apiData=apiData;
    this.userData=apiData.userData;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBody(apiData: apiData),
    );
  }
}

class DashBoardBody extends StatefulWidget {
  late ApiData apiData;
  late UserData userData;
  DashBoardBody({required ApiData apiData}){
    this.apiData=apiData;
    userData=apiData.userData;
    print(apiData.problemData.getVerdictList().length);
  }

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Provider.of<ThemeChange>(context, listen: true);
    double topBannerHeight=(size.height * 0.30) -
              (MediaQuery.of(context).viewPadding.top + 6);
    Color rankedPrimaryColor =
        ColorDecider(rank: widget.userData.rank).getPrimaryColor();
    Color rankedAccentColor =
        ColorDecider(rank: widget.userData.rank).getAccentColor();

    Color primaryColor = Theme.of(context).primaryColor;
    if (primaryColor != rankedPrimaryColor) {
      Future.delayed(const Duration(seconds: 0), () {
        theme.setPrimaryColor = rankedPrimaryColor;
        theme.setAccentColor = rankedAccentColor;
      });
    }
    return Stack(
      fit: StackFit.expand,
      children: [
      TopBannerWidget(height: topBannerHeight,size: size,width: size.width, userData: widget.userData), 
      BottumStatisticsHolderWidget(size: size, apiData: widget.apiData,)
      ],
    );
  }

}
