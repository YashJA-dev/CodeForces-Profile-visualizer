import 'package:flutter/material.dart';
import 'package:wp_visualizer/Fetching%20API/Models/cf_user_info.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CodeForces',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CfUserInfoProvider().fetchUserInfo('yash13203'),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const CircularProgressIndicator();
          default:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Loaded'),
              ),
            );
        }
      },
    );
  }
}
