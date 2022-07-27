import 'package:flutter/material.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'StisticsListBuilderWidget.dart';

class BottumStatisticsHolderWidget extends StatelessWidget {
  ApiData apiData;
  Size size;
  BottumStatisticsHolderWidget({required this.size, required this.apiData});
  @override
  Widget build(BuildContext context) {
    double height=size.height*0.70;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.30),
      height: height,
      child: Card(
        elevation: 30,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: StisticsListBuilderWidget(
          apiData: apiData,
          height: height,
          width: size.width,
          size: size,
        ),
      ),
    );
  }
}
