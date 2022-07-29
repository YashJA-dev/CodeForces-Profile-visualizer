import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoBlogs_Written extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      child: Text(
        "No Blogs Written by the user :*",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
