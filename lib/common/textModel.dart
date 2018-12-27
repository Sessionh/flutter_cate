import 'package:flutter/material.dart';

class TextModel extends StatefulWidget {
  final String title;
  TextModel({Key key, this.title: ''}):super(key: key);
  TextModelApp createState() => new TextModelApp();

}

class TextModelApp extends State<TextModel> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> opacity;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    opacity = new Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
      super.initState();
  }
  
 

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(minWidth: 280.0, maxWidth: 280.0),
          padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 6.0, right: 6.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, .5),
            borderRadius: BorderRadius.all(Radius.circular(6.0)) 
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 18.0),),
                )
                
              
              ],
            ),
        )
      ),
    );
    
    
    
    
  
  }

  @override
  void deactivate() {
    _controller.dispose();
    super.deactivate();
  }


}