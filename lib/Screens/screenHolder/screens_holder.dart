import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '/Model/ApiData.dart';
import '/Screens/Blogs/Blogs_screen.dart';
import '/Screens/Contest/Contest_Screen.dart';

import '../DashBord/dashboard_screen.dart';

class ScreensHolder extends StatefulWidget {
  ApiData apiData;
  ScreensHolder({required this.apiData});
  @override
  State<ScreensHolder> createState() => _ScreensHolderState();
}

class _ScreensHolderState extends State<ScreensHolder> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    ApiData apiData = widget.apiData;
    double height = MediaQuery.of(context).size.height;
    final List<Widget> icons = [
      Icon(Icons.note_outlined),
      Icon(Icons.dashboard_outlined),
      Icon(Icons.line_style_outlined)
    ];
    final screens = [
      Blogs_screen(blogsInfo: widget.apiData.getBlogsInfo),
      Dashboard(apiData: widget.apiData),
      Contest_Graph_screen(apiData: widget.apiData),
    ];
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        items: icons,
        height: 60,
        index: index,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 700),
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (ind) {
          index = ind;
          setState(() {
            index;
          });
        },
      ),
    );
  }
}
