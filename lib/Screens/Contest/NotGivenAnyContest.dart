import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotGivenAnyContest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "User Have Not Given Any Contest :*",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
