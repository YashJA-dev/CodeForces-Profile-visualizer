import 'package:flutter/material.dart';
import 'package:wp_visualizer/Controller/Fetching%20Api/user_information.dart';
import 'package:wp_visualizer/Model/UserData.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CodeForces',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData>(
      future: UserInfo(handle: "yash13203").fetchUserInfo(),
      builder: (context, snapshot) {    
          switch(snapshot.connectionState){
            case ConnectionState.waiting:return form("waoting");
            default:
            if(snapshot.hasError)return form("error");
            else if(snapshot.hasData)return form(snapshot.data?.rank);
            else return form("error");
          }   
      },
    );
  }
  Scaffold form(String text){
    return Scaffold(
      appBar: AppBar(title: Text(text)),
      body: Container(),
      );
  }

}
