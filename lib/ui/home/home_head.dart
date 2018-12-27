import 'package:flutter/material.dart';

class HomeHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 60.0,
            height: 46.0,
            // color: Color(0xFFcccccc),
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Icon(Icons.add,size: 36.0,),
            
          ),
          Container(
            width: MediaQuery.of(context).size.width - 200.0,
            height: 36.0,
            decoration: BoxDecoration(
              color: const Color(0xFFe8eaec),
              borderRadius: BorderRadius.all(Radius.circular(6.0))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Icon( IconData(0xe652, fontFamily: 'iconfont'),color: Colors.grey,size: 16.0),
                  
                ),
                Text('菜谱、用户等', style:TextStyle(
                  color: Colors.grey[600]

                ))
              ],

            ),
          ),
          Container(
            width: 80.0,
            height: 36.0,
            // color: Color(0xFFcccccc),
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(IconData(0xe636, fontFamily: 'iconfont')),
            
          ),
          Container(
            width: 60.0,
            height: 36.0,
            // color: Color(0xFFcccccc),
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Icon(IconData(0xe679, fontFamily: 'iconfont'), color: Colors.grey[600],),
            
          ),

      

        ],
      ),
    );
  }
} 