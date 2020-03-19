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
            padding: EdgeInsets.symmetric(vertical:0, horizontal: 0),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: MediaQuery.of(context).size.width / 150),
                itemCount: myList.length,
                itemBuilder: (context, index) => ClipRRect(
                      child:Padding(
                        padding: index == 0 ? EdgeInsets.fromLTRB(18, 14, 18, 14) : EdgeInsets.fromLTRB(2, 14, 18, 14),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.55,
                          height: 150,
                          child: Center(
                              child: index == 0 ? null : Text(
                                myList[index].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )),
                          decoration: BoxDecoration(
                              color: index== 0? Colors.transparent : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: index == 0 ? Colors.transparent : Colors.grey,
                                  offset: Offset(2.0, 2.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                              /*gradient: index == 1 ?  LinearGradient(
                                  colors: [Colors.blue[200], Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight) :
                              LinearGradient(
                                  colors: [Colors.transparent, Colors.transparent],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)*/
                          ),
                        ),
                      )
                    )),
          )
        ],
      ),
    );
  }
}
