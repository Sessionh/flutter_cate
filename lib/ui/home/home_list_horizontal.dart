import 'package:flutter/material.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:transparent_image/transparent_image.dart';
import 'package:app/common/pulltorefresh.dart';
import 'foot_detail.dart';

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
          width: 180.0,
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Column(
            children: <Widget>[
              FadeInImage.assetNetwork(
                  width: 180.0,
                  height: 100.0,
                  fit: BoxFit.fill,
                  image: 'https://cp1.douguo.com/upload/caiku/3/7/f/260x220_37276d4bd634ad7bac7a2cef0794816f.jpg',
                  placeholder: 'images/back.png',
              ),

              // Image.network(
              //   'https://cp1.douguo.com/upload/caiku/3/7/f/260x220_37276d4bd634ad7bac7a2cef0794816f.jpg',
              //   height: 100.0,
              //   width: 180.0,
              //   fit: BoxFit.fill,
              //   ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                width: 180.0,
                child: Text('[进行中]2018年我学会的一道菜'),
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

        new Container(
          height: 160.0,
          width: 180.0,
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Column(
            children: <Widget>[
              // Image.network(
              //   'https://i1.douguo.com/upload/note/c/a/0/320_ca47a5a86abe8cdddf025feddaf2f0a0.jpg',
              //   height: 100.0,
              //   width: 180.0,
              //   fit: BoxFit.fill,
              // ),
              GestureDetector(
                onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return FootDetail(
                      name: 'hero',
                      url: 'https://i1.douguo.com/upload/note/c/a/0/320_ca47a5a86abe8cdddf025feddaf2f0a0.jpg',
                    );
                  }));
                  
                },
                child:  Hero(
                tag: 'hero',
                  child: Image.network(
                        'https://i1.douguo.com/upload/note/c/a/0/320_ca47a5a86abe8cdddf025feddaf2f0a0.jpg',
                        height: 100.0,
                        width: 180.0,
                        fit: BoxFit.fill,
                        ),
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(top: 5.0),
                width: 180.0,
                child: Text('[进行中]2018年我学会的一道菜'),
              )
              
            ],
          ),

        ),
           
      ],
          
    );
    
  }
}