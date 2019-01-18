import 'package:flutter/material.dart';

class FootDetail extends StatelessWidget {
  final String name;
  final String url;
  FootDetail({Key key, @required this.name, this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
              tag: name,
              child: Image.network(
                    url,
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 5.0),
              child:  GestureDetector(
                  child: Icon(IconData(0xe617, fontFamily: 'iconfont'), size: 30.0, color: Colors.white,),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
              ),
            )
          

        ],
      )
      
     
    );
    
    
  }
}