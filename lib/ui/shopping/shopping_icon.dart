import 'package:flutter/material.dart';

class IconExpanded {
  IconData icon;
  Color color;
  String text;
  IconExpanded(this.icon, this.color, this.text);
}

class ShoppingIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createExpanded(IconExpanded list) => Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Icon(list.icon, color: list.color, size: 30.0,),
          Text(list.text, style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 15.0,
          ),),

        ],
      ),
    );
   List<IconExpanded> data = [
    IconExpanded(IconData(0xe653, fontFamily: 'iconfont'), Colors.blue, '会员商品'),
    IconExpanded(IconData(0xe62d, fontFamily: 'iconfont'), Colors.green, '豆果我买'),
    IconExpanded(IconData(0xe625, fontFamily: 'iconfont'), Colors.red, '健康养生'),
    IconExpanded(IconData(0xe65c, fontFamily: 'iconfont'), Colors.blue, '烘培美厨'),

   ];
   
    
    return Container(
      // height: 200.0,
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        children: <Widget>[
          Row(
            children: data.map((list) => createExpanded(list)).toList(),
          ),

        ],
      )
      
      
    );
  }
}