import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'package:app/libs/util.dart';
import 'package:app/bloc/login_bloc.dart';
import 'package:app/model/login_model.dart';
import 'package:app/common/circleProgress.dart';

class LoginButton extends StatefulWidget{
  final Function resultClick;
  final String title;
  final LoginBloc bloc;
  final LoginModel vm;
  LoginButton({Key key,this.resultClick, this.title, this.bloc, this.vm}):super(key:key);
  LoginButtonApp createState() => new LoginButtonApp();
}

class LoginButtonApp extends State<LoginButton> with SingleTickerProviderStateMixin{
   AnimationController _controller;
  Animation<double> widthA;
  Animation<double> radiusA;

  @override
  void initState() {
     _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    radiusA = new Tween(begin: 0.0, end: 30.0).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widthA = new Tween(begin: MediaQuery.of(context).size.width*0.8, end: 60.0).animate(_controller);
    return  AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Stack(
          children: <Widget>[
            Offstage(
              offstage: widget.vm.isButtonShow,
              child: GestureDetector(
                onTap: () {
                  _controller.forward();
                  Util.setTimeOut(300, () {
                      widget.resultClick(0);
                      widget.vm.isButtonShow = true;
                      widget.bloc.setDate( widget.vm);
                     
                      widget.bloc.getProduct(widget.vm).then((res) {
                        print(res);
                        if (res == '成功') {
                        
                         _controller.reset();
                          widget.resultClick(1);

                        }
                        _controller.reset();

                      }

                      );


                  });
                

                },
                child: Container(
                  width: widthA.value,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(radiusA.value)),
                    color: Color.fromRGBO(0, 157, 178, .8),
                    
                  ),
                  child:Center(
                    child: Text('登陆', style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),),
                  ),

                ),
              ),
            ),
            
            Offstage(
              offstage: !widget.vm.isButtonShow,
              child:  Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Color.fromRGBO(0, 157, 178, .8)
                ),
                child: SpinKitRing(size: 55.0, color: Colors.white70, lineWidth: 4.0,),

              ),
            )

           
            
            

          ],
        );

      });
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


}




