import 'package:flutter/material.dart';

class IconExpanded {
  IconData icon;
  Color color;
  String text;
  IconExpanded(this.icon, this.color, this.text);
}

class HomeIcons extends StatelessWidget {
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
    IconExpanded(IconData(0xe653, fontFamily: 'iconfont'), Colors.blue, '菜谱分类'),
    IconExpanded(IconData(0xe62d, fontFamily: 'iconfont'), Colors.green, '健康管理'),
    IconExpanded(IconData(0xe625, fontFamily: 'iconfont'), Colors.red, '签到领红包'),
    IconExpanded(IconData(0xe65c, fontFamily: 'iconfont'), Colors.blue, '关注动态'),

   ];
   List<IconExpanded> data1 = [
    IconExpanded(IconData(0xe607, fontFamily: 'iconfont'), Colors.blue, '精品菜单'),
    IconExpanded(IconData(0xe66c, fontFamily: 'iconfont'), Colors.red, '安佳美食站'),
    IconExpanded(IconData(0xe65d, fontFamily: 'iconfont'), Colors.blue, '视频菜单'),
    IconExpanded(IconData(0xe616, fontFamily: 'iconfont'), Colors.orange, '母婴专区'),

   ];
    
    return Container(
      // height: 200.0,
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        children: <Widget>[
          Row(
            children: data.map((list) => createExpanded(list)).toList(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Row(
              children: data1.map((list) => createExpanded(list)).toList(),
            ),
          )

        ],
      )
      
      
    );
  }
}