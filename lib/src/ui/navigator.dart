import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/src/repository/weather_repositry.dart';
import 'package:untitled1/src/ui/json_parsing.dart';
import 'package:untitled1/src/ui/simple_bloc.dart';
import 'package:untitled1/weather_bloc/bloc.dart';
import 'package:untitled1/weather_bloc/ui/weather_search_page.dart';
import 'horizontal_scroll.dart';

class NavigatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                ButtonTheme(
                  minWidth: 400,
                  child: RaisedButton(
                    color: Colors.black54,
                    textColor: Colors.white,
                    child: Text("Vertical List"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JsonParsingMap()));
                    },
                  ),
                ),
                SizedBox(height: 10),
                ButtonTheme(
                  minWidth: 400,
                  child: RaisedButton(
                    color: Colors.black54,
                    textColor: Colors.white,
                    child: Text("Horizontal List"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HorizontalScroll()));
                    },
                  ),
                ),
                SizedBox(height: 10),
                ButtonTheme(
                  minWidth: 400,
                  child: RaisedButton(
                    color: Colors.black54,
                    textColor: Colors.white,
                    child: Text("Simple bloc"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Joaa()));
                    },
                  ),
                ),
                SizedBox(height: 10),
                ButtonTheme(
                  minWidth: 400,
                  child: RaisedButton(
                    color: Colors.black54,
                    textColor: Colors.white,
                    child: Text("Flutter bloc example"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context)=> WeatherWidget()));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocProvider(
        builder: (context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ) ,
    );
  }
}

