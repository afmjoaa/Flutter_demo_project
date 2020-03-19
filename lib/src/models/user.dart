

class UserList {
  final List<User> users;

  UserList({this.users});

  factory UserList.fromJson(List<dynamic> parsedUsers) {
    List<User> posts = new List<User>();
    posts = parsedUsers.map((i) => User.myFromJson(i)).toList();
    return new UserList(users: posts);
  }
}

class User{ 
  int id;
  String name;
  String userName;
  String email;
  String phone;
  String website;
  Map<String, dynamic> company;
  Map<String, dynamic> address;

  User({this.id, this.name, this.userName, this.email, this.phone, this.website, this.company, this.address});

  factory User.myFromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
      address: json['address']
    );
  }

/*
  * {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }
  * */
}