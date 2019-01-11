import 'package:flutter/material.dart';

class NodeHead extends StatefulWidget {
  NodeHeadState createState() => new NodeHeadState();

}
class NodeHeadState extends State<NodeHead> with SingleTickerProviderStateMixin {
  AnimationController leftController;
  Animation<Offset> animation;

  @override
  void initState() {

    leftController = new AnimationController(
        duration: const Duration(milliseconds: 80), vsync: this);
    animation = new Tween(begin: Offset(0.0, 0.0), end: Offset(0.5, 0.0)).animate(
      leftController
    );

    super.initState();
  }
  @override
  void dispose() {
    leftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 44.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5)
        )
      ),
      // height: 91.0,
      child: 
      
      Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 160.0,
              height: 40.0,
              // color: Colors.green,
              child:  Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.0),
                    child:  Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                print(222);
                                leftController.reverse();

                              },
                              child:  Container(
                                width: 60.0,
                                height: 40.0,
                                // color: Colors.green,
                                child: Center(
                                  child: Text('精选',style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                ),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                print(1111);
                                leftController.forward();

                              },
                              child:  Container(
                                width: 60.0,
                                height: 40.0,
                                // color: Colors.green,
                                child: Center(
                                  child: Text('最新',style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                ),
                              )),
                            )
                          ),
                        ),
                        
                        
                        
                      ],
                    ),
                  ),

                  SlideTransition(
                    position: animation,
                    child:  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        height: 2.0,
                        width: 60.0,
                        color: Colors.black,
                      ),
                    ),
                  )


                ],
              )
              
              

            ),
          ),
      
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(IconData(0xe679, fontFamily: 'iconfont'), color: Colors.grey[600],),
            ),
          ),
          
         
           

        ],
      )
     
    );

  }

}