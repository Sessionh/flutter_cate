import 'package:flutter/material.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:app/common/pulltorefresh.dart';
import 'foot_detail.dart';

class ShoppingListHorizontal extends StatefulWidget {
 
  ShoppingListHorizontalState createState() => new ShoppingListHorizontalState();

}

class ShoppingListHorizontalState extends State<ShoppingListHorizontal> {

   @override
   void initState() {
       super.initState();
     }
  @override
  Widget build(BuildContext context) {
    return Pulltorefresh(
      height: 180.0,
      axis: Axis.horizontal,
      isFooterShow: false,
      isHeaderShow: false,
      data: <Widget>[
        new Container(
          width: 10.0,
        ),
        new Container(
          height: 160.0,
          width: 140.0,
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Column(
            children: <Widget>[
              FadeInImage.assetNetwork(
                  width: 140.0,
                  height: 100.0,
                  fit: BoxFit.fill,
                  image: 'https://cp1.douguo.com/upload/caiku/3/7/f/260x220_37276d4bd634ad7bac7a2cef0794816f.jpg',
                  placeholder: 'images/back.png',
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                width: 140.0,
                child: DefaultTextStyle(
                  style: new TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w600,
                    color: Colors.black,
                    // decoration: TextDecoration.underline
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  child: new Text('介绍的计算机等级升级的手机待机时间')
                ),
              )
              
            ],
          ),

        ),

        new Container(
          height: 160.0,
          width: 180.0,
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Column(
            children: <Widget>[
              FadeInImage.assetNetwork(
                  width: 180.0,
                  height: 100.0,
                  fit: BoxFit.fill,
                  fadeOutDuration: const Duration(milliseconds: 300),
                  fadeInDuration: const Duration(milliseconds: 100),
                  image: 'https://cp1.douguo.com/upload/caiku/8/8/3/220x220_889c1ab80b76d851f42018f6da80c253.jpg',
                  placeholder: 'images/back.png',
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                width: 180.0,
                child: Text('[进行中]2019,你能把我怎么样？'),
              )
              
            ],
          ),

        ),
           
      ],
          
    );
    
  }
}