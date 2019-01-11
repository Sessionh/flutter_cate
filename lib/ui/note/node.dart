import 'package:flutter/material.dart';
import 'package:app/libs/util.dart';
import 'package:app/common/pulltorefresh.dart';
import 'node_head.dart';


class Node extends StatefulWidget {
  NodeApp createState() => new NodeApp();

}
class NodeApp extends State<Node> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [
      Container(
        margin: EdgeInsets.only(top: 20.0),
        height: 300.0,
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        height: 300.0,
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
      ),
        Container(
        height: 300.0,
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
      )
    ];
  return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          NodeHead(),
          Pulltorefresh(
            data: data,
            height: MediaQuery.of(context).size.height - 142.0,
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
          )
          
        ],
      ),
    )
);
    
     
  }

}