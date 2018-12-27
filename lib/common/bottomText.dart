import 'package:flutter/material.dart';
import 'dart:async';

class ButtomText extends StatefulWidget {
  final double fontSize;
  final Color textColor;
  final String text;
  final Function result;
  final Color focusColor;
  ButtomText({Key key, 
  this.fontSize: 18.0, 
  this.textColor: Colors.grey, 
  this.text: '', 
  this.result, 
  this.focusColor: Colors.blue}):assert(result != null),super(key: key);

  @override
  ButtomTextApp createState() => ButtomTextApp();
}

class ButtomTextApp extends State<ButtomText> {
  bool type = false;
 
  final StreamController<bool> _streamController = StreamController<bool>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(  // 监听Stream，每次值改变的时候，更新Text中的内容
          stream: _streamController.stream,
          initialData: type,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
            return GestureDetector(
              onTap: () {
                // type = true;
                // _streamController.sink.add(type);
                widget.result();
              },
              
              onScaleUpdate: (ev) {
                type = false;
                _streamController.sink.add(type);

              },
              onTapDown: (ev) {
                 type = true;
                _streamController.sink.add(type);

              },
              onTapUp: (ev) {
                type = false;
                _streamController.sink.add(type);

              },
              child: Text(widget.text, style: TextStyle(
                color: type ? widget.focusColor : widget.textColor ,
                fontSize: widget.fontSize,

              ),),
            );
          }
        );

  }
  @override
  void dispose(){
    _streamController.close();
    super.dispose();
  }

}