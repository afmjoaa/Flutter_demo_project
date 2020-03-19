import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled1/src/models/user.dart';

class Network {

  final String url;

  Network(this.url);

  Future<UserList> loadPosts() async {
    final response = await get(Uri.encodeFull(url));

    if (response.statusCode == 200) {
      //OK
      return UserList.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get posts");
    }

  }


}