import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wp_visualizer/Model/UserData.dart';

class TopBannerWidget extends StatelessWidget {
  Size size;
  double height;
  double width;
  UserData userData;
  
  TopBannerWidget({required this.size,required this.height,required this.width,required this.userData});
  @override
  Widget build(BuildContext context) {
    bool online=userData.lastOnline=="Online";
    return Container(
      alignment: Alignment.topLeft,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: height,
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: height*0.30,
                  child: CircleAvatar(
                    radius: height*0.30,
                    foregroundImage:
                        NetworkImage("${userData.titlePhoto}"),
                    backgroundColor: Colors.transparent,
                  )),
              Text(
                userData.handle,
                style: TextStyle(fontSize: height*0.1, fontWeight: FontWeight.bold),
              ),
              Text(
                userData.rank,
                style: TextStyle(fontSize: height*0.08),
              ),
              online?Text("${userData.lastOnline}",style: TextStyle(fontSize: height*0.07,fontWeight: FontWeight.bold)):
              Text("Last Online ${userData.lastOnline}",style: TextStyle(fontSize: height*0.07)),
            ],
          ),
        ),
      ),
    );
  }
}