import 'package:flutter/material.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";

class HomeListHorizontal extends StatefulWidget {
 
  HomeListHorizontalApp createState() => new HomeListHorizontalApp();

}

class HomeListHorizontalApp extends State<HomeListHorizontal> {
    RefreshController refreshController;

   @override
   void initState() {
     refreshController = new RefreshController();
       super.initState();
     }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      child: new SmartRefresher(
        controller: refreshController,
        enablePullDown: false,
        enablePullUp: false,
        axis: Axis.horizontal,
        headerConfig: RefreshConfig(
          triggerDistance: 60.0,
        ),
        child: new ListView(
          // scrollDirection: Axis.horizontal,
          children: <Widget>[
             new Container(
              width: 10.0,
            ),
            new Container(
              height: 160.0,
              width: 180.0,
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   height: 110.0,
                  //   width: 180.0,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       fit:  BoxFit.fill,
                  //       image: AssetImage('https://cp1.douguo.com/upload/caiku/3/7/f/260x220_37276d4bd634ad7bac7a2cef0794816f.jpg')
                  //     )
                  //   ),
                  // ),
                  Image.network(
                    'https://cp1.douguo.com/upload/caiku/3/7/f/260x220_37276d4bd634ad7bac7a2cef0794816f.jpg',
                    height: 110.0,
                    width: 180.0,
                    fit: BoxFit.fill,
                    ),
                 
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text('33'),
                  )
                ],
              ),

            ),
            new Container(
              width: 160.0,
              margin: EdgeInsets.only(left: 10.0),
              color: Colors.blue,
            ),
            new Container(
              width: 160.0,
              margin: EdgeInsets.only(left: 10.0),
              color: Colors.green,
            ),
            new Container(
              width: 160.0,
              margin: EdgeInsets.only(left: 10.0),
              color: Colors.yellow,
            ),
            new Container(
              width: 160.0,
              margin: EdgeInsets.only(left: 10.0),
              color: Colors.orange,
            ),
          ],
        )
     ),
    );
  }
}