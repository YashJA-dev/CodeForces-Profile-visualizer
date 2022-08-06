import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wp_visualizer/Model/ApiData.dart';
import 'package:wp_visualizer/Screens/Graphs/Laguages_verdicts/Laguages_verdicts.dart';
import 'package:wp_visualizer/Screens/Graphs/Tags_by_rating/ProblemsByRating.dart';

import '../Graphs/subbmissions_verdict/Subbmissions_verdict.dart';

class GraphHolderBuilder extends StatelessWidget {
  ApiData apiData;
  GraphHolderBuilder({required this.apiData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: [
          GestureDetector(
            child:setImage(url: "images/problem.png"),
            onTap: () {
              
              openPage(page: Tags_by_rating(problemData: apiData.problemData ), context: context);
            },
          ),
          GestureDetector(
            child:setImage(url: "images/splas.png"),
            onTap: () {
              openPage(page: Subbmissions_verdict(problemData: apiData.problemData), context: context);
            },
          ),
        ],
        options: CarouselOptions(
          enlargeCenterPage: true,
        ),
      ),
    );
  }

  void openPage({required var page, required BuildContext context}) {
    Navigator.push(context, route(page));
  }

  MaterialPageRoute route(var page) {
    return MaterialPageRoute(builder: (context) => page);
  }
  Container setImage({required String url}){
    return Container(width: double.infinity,child: FittedBox( fit: BoxFit.fill,child:Image.asset(url),));
  }
}
