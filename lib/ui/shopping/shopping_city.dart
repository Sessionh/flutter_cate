import 'package:flutter/material.dart';
import 'package:app/common/pulltorefresh.dart';
import 'package:app/libs/util.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:app/ui/shopping/shopping_icon.dart';
import 'package:app/ui/shopping/shopping_list.dart';

class Shopping extends StatefulWidget {
  ShoppingState createState() => new ShoppingState();
  
}
class ShoppingState extends State<Shopping> {
   RefreshController refreshController;
   @override
     void initState() {
       refreshController = new RefreshController();
       super.initState();
     }

  @override
  Widget build(BuildContext context) {
    var _that = MediaQuery.of(context);
    var height = _that.size.height - _that.padding.top - _that.padding.bottom - 116.0;
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom
      ),
      child: Column(
        children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
             height: 56.0,
             decoration: BoxDecoration(
               border: Border(
                 bottom: BorderSide(color: Colors.grey, width: 0.5)
               )
             ),
            //  color: Colors.green,
             child: Row(
               children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 4.0),
                  child: Icon(IconData(0xe652, fontFamily: 'iconfont'),  size: 22.0,),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('商场', style: TextStyle(
                      fontSize: 20.0
                    ),),
                  ),
                ),
               Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(IconData(0xe610, fontFamily: 'iconfont'), size: 24.0,),
                )

               ],
             ),
           ),
           Pulltorefresh(
             controller: refreshController,
             height: height,
             headerResult: (ev) {
                Util.setTimeOut(800, () {
                  ev.sendBack(true, 3);
                  return false;
                });
              },
              footerResult: (ev) {
                  Util.setTimeOut(800, () {
                  ev.sendBack(false, 7);
                  return false;
                });
              },
             data: <Widget>[
               Image.network(
                 'https://cp1.douguo.com/upload/article/e/e/6/325x183_eeaceb3342974cec4a9c27dafda63b16.jpg',
                 width: MediaQuery.of(context).size.width,
                 height: 200.0,
                 fit: BoxFit.fill,
                ),
                ShoppingIcons(),
                ShoppingListHorizontal(),

             ],
              
           )
           
        ],
      ),

    );
  }

}