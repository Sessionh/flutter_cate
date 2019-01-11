import 'package:flutter/material.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:after_layout/after_layout.dart';
import 'package:app/common/pulltorefresh.dart';

class FootDetailData extends StatefulWidget {
  final String name;
  final String url;
  final String title;
  FootDetailData({Key key, @required this.name, @required this.url,  @required this.title});
  FootDetailDataApp createState() => new FootDetailDataApp();


} 

class FootDetailDataApp extends State<FootDetailData> {
  RefreshController refreshController;
  
  @override
  void initState() {
    refreshController = new RefreshController();
      super.initState();
    }
 
  @override
  Widget build(BuildContext context) {

    List<Widget> data = [
        
        Container(
          height: 300.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: Stack(
            children: <Widget>[
               Hero(
                    tag: widget.name,
                    child: Image.network(
                          widget.url,
                          // height: 300.0,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 5.0),
                  child:  GestureDetector(
                      child: Icon(IconData(0xe617, fontFamily: 'iconfont'), size: 30.0, color: Colors.white,),
                      onTap: () {
                        Navigator.pop(context);
                      },
                  ),
                ),

            ],
          ),
        ),
         Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ),
                
                  Align(
                    alignment: Alignment.centerLeft,
                    child:   Container(
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      color: Colors.orange,
                      child: Text('精品', style: TextStyle(color: Colors.white),),

                    ),
                  ),
                
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 16.0),
                    child: Text(
                      '可是看到可是看到看三大矿山空对空看可是抵扣税款抵扣税款抵扣说的可是看到可是看到可是看到数控雕刻看书看电视看到',
                      style: TextStyle(
                        fontSize: 18.0
                      )
                    ),
                  )
                ],
              ),
            ),
      
      ];
    return 
    Scaffold(
          body: 
        Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      
                      Pulltorefresh(
                        height: MediaQuery.of(context).size.height,
                        isFooterShow: false,
                        isHeaderShow: false,
                        data: data
                      )
                      

                    ],
                  ),

                ],
              ),
        ),
        
        );
    
    
    
  }
}

// class HomeScreen extends StatefulWidget {
//   @override
//   HomeScreenState createState() => new HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreen> with AfterLayoutMixin<HomeScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(body: new Container(color: Colors.red));
//   }

//   @override
//   void afterFirstLayout(BuildContext context) {
//     // Calling the same function "after layout" to resolve the issue.
//     showHelloWorld();
//   }

//   void showHelloWorld() {
//     showDialog(
//       context: context,
//       builder: (context) => new AlertDialog(
//             content: new Text('Hello World'),
//             actions: <Widget>[
//               new FlatButton(
//                 child: new Text('DISMISS'),
//                 onPressed: () => Navigator.of(context).pop(),
//               )
//             ],
//           ),
//     );
//   }
// }