import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalScroll extends StatelessWidget {
  final myList = new List<int>.generate(15, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal Scroll"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            "Only Horizontal Scroll".toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/wide_image.jpg"),
                    fit: BoxFit.cover)),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: MediaQuery.of(context).size.width / 150),
                itemCount: myList.length + 1,
                itemBuilder: (context, index) => index == 0
                    ? SizedBox(width: MediaQuery.of(context).size.width / 2.2)
                    : ClipRRect(
                        child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 14, 18, 14),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.55,
                          height: 150,
                          child: Center(
                              child: Text(
                            myList[index - 1].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2.0, 2.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                  colors: [Colors.blue[200], Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                        ),
                      ))),
          )
        ],
      ),
    );
  }
}
