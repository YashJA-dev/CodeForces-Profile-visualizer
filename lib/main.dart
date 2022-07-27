import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_visualizer/Colors/ThemeChange.dart';
import 'package:wp_visualizer/Controller/Fetching%20Api/user_information_fetcher.dart';
import 'package:wp_visualizer/Model/UserData.dart';
import 'package:wp_visualizer/Screens/splash/Splash.dart';

void main() {
  runApp(
    Home(),
  );
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChange>(
      create: (context) =>
          ThemeChange(accentColor: Colors.black, primaryColor: Colors.cyan),
      child: Consumer<ThemeChange>(
        builder: (context, themData, child) {
          return MaterialApp(
            title: 'CodeForces',
            theme: ThemeData(
                primarySwatch: themData.primaryColor, accentColor: themData.accentColor),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
