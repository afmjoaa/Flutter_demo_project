import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled1/src/models/user.dart';
import 'package:untitled1/src/repository/network.dart';

class JsonParsingMap extends StatefulWidget {
  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<UserList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/users");
    data = network.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing PODO"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<UserList> snapshot) {
                List<User> allUsers;
                if ( snapshot.hasData) {
                  allUsers = snapshot.data.users;

                  return createListView(allUsers, context);

                }else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  Widget createListView(List<User> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0,),
                ListTile(
                  title: Text("${data[index].name}"),
                  subtitle: Text("${data[index].email}"),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 23,
                        child: Text('${data[index].id}'),
                      )
                    ],
                  ),
                )
              ],
            );

          }),
    );
  }
}

