import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
           height: 56.0,
           decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(color: Colors.grey, width: 0.5)
             )
           ),
           child: Row(
             children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(IconData(0xe653, fontFamily: 'iconfont')),
              ),
               Expanded(
                 flex: 1,
                 child: Center(
                   child: Text('我的', style: TextStyle(
                     fontSize: 20.0
                   ),),
                 ),
               ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(IconData(0xe679, fontFamily: 'iconfont')),
                )
               

             ],
           ),

         ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child:  Image.asset(
              'images/userLogo.png',
              height: 300.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width*0.8,
            height: 54.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(27.0)),
              color: Colors.green,
            ),
            child: Center(
              child: Text('微信登陆', style: TextStyle(color: Colors.white, fontSize: 20.0),),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width*0.8,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.orange,
            ),
            child: Center(
              child: Text('登陆/注册', style: TextStyle(color: Colors.white, fontSize: 20.0),),
            ),
          )

        ],
      ),

    );
  }
 
}


