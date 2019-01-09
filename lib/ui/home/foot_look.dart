import 'package:flutter/material.dart';
import 'foo_detail_data.dart';

class FootLook extends StatelessWidget {
  final String name;
  final String url;
  final String title;
  final String userName;
  FootLook({Key key, @required this.name, @required this.url, @required this.title, @required this.userName });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: new Align(
              alignment: new FractionalOffset(0.0, 0.0),
              child:  DefaultTextStyle(
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  // decoration: TextDecoration.underline
                ),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                child: new Text(title)
              ),
            ),
          ),
           
         
          Row(
            children: <Widget>[
              Text(userName,style: TextStyle(color: Colors.grey),),
              new Expanded(
                child: new Text(''),
              ),
              Icon(IconData(0xe681, fontFamily: 'iconfont'), size: 20.0, color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child:  Text('68573',style: TextStyle(color: Colors.grey),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child:  Icon(IconData(0xe618, fontFamily: 'iconfont'),size: 18.0, color: Colors.grey,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child:  Text('2412',style: TextStyle(color: Colors.grey),),
              )
             
            ],
          ),
          Container(
            height: 200.0,
            padding: EdgeInsets.only(top: 5.0),
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: name,
                child:  GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new FootDetailData(
                        name: name,
                        url: url,
                        title: title,
                      )),
                    );
                    
                  },
                  child: Image.network(
                    url,
                    fit: BoxFit.fill,
                  ),
                ),
                
               
              ),
          )
         
        ],
      ),

    );
  }
}