import 'package:flutter/material.dart';
import 'package:wp_visualizer/Controller/Fetching%20Api/user_information.dart';
import 'package:wp_visualizer/Model/UserData.dart';
import 'package:wp_visualizer/Screens/Splash.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CodeForces',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.purpleAccent
      ),
      home: SplashScreen(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData>(
      future: UserInfo(handle: "yash13203").fetchUserInfo(),
      builder: (context, snapshot) {    
          switch(snapshot.connectionState){
            case ConnectionState.waiting:return form("waiting");
            default:
            if(snapshot.hasError)return form("error");
            else if(snapshot.hasData)return form((snapshot.data?.rank) );
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
