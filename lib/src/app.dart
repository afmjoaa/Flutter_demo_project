import 'package:flutter/material.dart';
import 'package:untitled1/src/ui/json_parsing.dart';
import 'package:async/async.dart';
import 'package:untitled1/src/ui/navigator.dart';
//import 'ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:NavigatorWidget()
    );
  }
}



