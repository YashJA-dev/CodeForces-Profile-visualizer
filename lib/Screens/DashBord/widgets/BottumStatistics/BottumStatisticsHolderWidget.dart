import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '/Model/UserData.dart';
import '/Screens/DashBord/widgets/BottumStatistics/staticsGridWIdget.dart';

class BottumStatisticsHolderWidget extends StatelessWidget {
  UserData userData;
  Size size;
  BottumStatisticsHolderWidget({required this.size, required this.userData});
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
        child: StisticsGridBuilderWidget(
          userData: userData,
          height: height-10,
          width: size.width,
          size: size,
        ),
      ),
    );
  }
}
