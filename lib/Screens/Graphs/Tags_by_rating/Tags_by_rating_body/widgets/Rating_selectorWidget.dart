import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../../Providers/TagsByRating_Provider.dart';


class Rating_selectorWidget extends StatelessWidget {
  
 
    
  @override
  Widget build(BuildContext context) {
  Tags_by_rating_Provider tags_by_rating_provider=
  Provider.of<Tags_by_rating_Provider>(context);
  int? rating1=tags_by_rating_provider.rating_dropDown1;
  int? rating2=tags_by_rating_provider.rating_dropDown2;
  // int? rating1=800;
  // int? rating2=3500;
   List<int> rating = [];
  for (int i = 800; i <= 3500; i+=100) {
    rating.add(i);
  }
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<int>(
            items: rating.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text("$value"),
              );
            }).toList(),
            menuMaxHeight: 250,
            hint: Text("rating 1"),
            value: rating1,
            onChanged: (selected) {
              tags_by_rating_provider.rating_dropDown1=selected;
            },
          ),
          SizedBox(
            width: 10,
          ),
          DropdownButton<int>(
            items: rating.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text("$value"),
              );
            }).toList(),
            hint: Text("rating 2"),
            value: rating2,
            menuMaxHeight: 250,
            onChanged: (selected) {
                tags_by_rating_provider.rating_dropDown2=selected;
            },
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Visualize.."),
          ),
        ],
      ),
    );
  }
}
