import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userNameController = TextEditingController();
  int userNameValidation = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:
          // Image.file(File("images/splash.jpg")),
          Container(
        height: size.height * 0.8,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: FittedBox(
                    child: Image.asset(
                  "images/splas.png",
                  fit: BoxFit.cover,
                ))),
            Container(
              margin: EdgeInsets.all(10),
              width: size.width,
              child: Text(
                "Pls enter you codeforces profile",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'User Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  errorText: errorTextShow(userNameValidation)),
              controller: userNameController,
              onSubmitted: (_){
                fetchData(userNameController);
              },
              onChanged: (_){
                onChangeUserName();
              },
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              child: Text("show data"),
              onPressed: () => {
                fetchData(userNameController),
              },
              color: Theme.of(context).primaryColor,
              minWidth: size.width,
            )
          ],
        ),
      ),
    );
  }

  errorTextShow(int userNameValidation) {
    if (userNameValidation == -1)
      return "Internet Not Stable";
    else if (userNameValidation == -2) return "Invalid UserName";
    return null;
  }

  fetchData(TextEditingController userNameController) async {
    bool connection=await connectivityChk();
    if(connection){
      print("connected");
    }
  }
  Future<bool> connectivityChk() async {
    try {
      final ConnectivityResult result =
          await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        userNameValidation = 0;
      } else {
        userNameValidation = -1;
      }
      setState(() {
        userNameValidation;
      });
      return userNameValidation == 0;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }

  onChangeUserName() {
    if (userNameValidation != 0) {
      userNameValidation = 0;
      setState(() {
        userNameValidation;
      });
    }
  }
}
