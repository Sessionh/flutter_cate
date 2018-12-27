import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/login_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/login_model.dart';
import 'package:app/model/main_model.dart';
import 'login_form.dart';
import 'package:app/common/bottomText.dart';
import 'package:app/libs/util.dart';
import 'login_button.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:app/common/circleProgress.dart';
import 'package:app/common/textModel.dart';


class LoginApp extends StatelessWidget {
  final MainModel mainModel;
  final AnimationController loginButtonController;
  LoginApp(this.mainModel, this.loginButtonController);

  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    Animation<double> animation = new Tween(begin: 100.0, end: 200.0).animate(
      loginButtonController
    );
    final formKey = GlobalKey<FormState>();
   
    Util.setUIStyle(false);

    resultClick() {
      print(333);
    }
    final nodeFocus = FocusNode();
    nodeFocus.addListener(() {
      print(33344);
      // print(nodeFocus.hasFocus);
      // if (nodeFocus.hasFocus) {

      // } else {

      // }

    });
  

    return StreamBuilder(
      initialData: LoginModel.initDate(),
      stream: bloc.outList,
      builder: (BuildContext context, AsyncSnapshot<LoginModel> snap){
        var vm = snap.data;
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[

              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                   decoration: new  BoxDecoration(
                    // image:  DecorationImage(image: AssetImage('images/logos21.png'), fit: BoxFit.fill),
                    ),
                  child:  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 100.0, bottom: 16.0),
                        child:  Image.asset(
                          'images/logoUser.png',
                          height: 86.0,
                          width: 86.0,
                        ),
                      ),
                      // LoginForm(),
                     
                   
                      Form(
                        key: formKey,
                        child: Container(
                          // height: 300.0,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[

                              Row(
                                  children: <Widget>[
                                    new Container(
                                    child: new Icon(Icons.person, color: Colors.black54),
                                    width: 65.0,
                                  ),
                                  new Expanded(
                                    child: 
                                    TextFormField(
                                        decoration: InputDecoration(labelText: '用户名', border: InputBorder.none),
                                        obscureText: false,
                                        onSaved: (val) =>  vm.userName = val,
                                        keyboardType: TextInputType.text,
                                        autocorrect: false,
                                        enabled: true, //是否允许用户输入
                                        style: TextStyle(
                                            color: 
                                                  Colors.black),
                                      ),
                                  )

                                  ]
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.3, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    new Container(
                                      child: new Icon(Icons.https, color: Colors.black54),
                                      width: 65.0,
                                    ),
                                    new Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: '密码',
                                          border: InputBorder.none
                                        ),
                                        focusNode: nodeFocus,
                                        onSaved: (val) =>  vm.password = val,
                                        keyboardType: TextInputType.text,
                                        autocorrect: false,
                                        obscureText:  vm.obscureText, // 是否可见
                                        style: TextStyle(
                                            color: vm.isDarkTheme
                                                ? Colors.white
                                                : Colors.black
                                        ),
                                      ),
                                    ),
                                    new Container(
                                      child: new IconButton(
                                        icon: Icon(
                                          vm.obscureText ? Icons.visibility_off :  Icons.remove_red_eye,
                                          color: Colors.black54),
                                        onPressed: () {
                                          print(33);
                                          if (vm.obscureText) {
                                            vm.obscureText = false;
                                            bloc.setDate(vm);
                                          } else {
                                             vm.obscureText = true;
                                             bloc.setDate(vm);
                                          }
                                           
                                          

                                        },

                                      ),
                                      
                                      width: 60.0,
                                    ),

                                  ]
                                ),
                                 Container(
                                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 35.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 0.3, color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                      LoginButton(
                        resultClick: (type) {
                          if (type == 0) { 
                            bloc.forSubmitted(formKey);
                            FocusScope.of(context).requestFocus(new FocusNode());// 失去焦点 关闭键盘
                            

                          } else {
                            mainModel.isLogin = true;
                            main.setData(mainModel);

                          }
                          
                         
                            
                        },
                        bloc: bloc,
                        vm: vm,
                      ),

                      
                      Row(
                        children: <Widget>[
                        
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1, top: 10.0),
                            child: ButtomText(text: '忘记密码？', result: () {
                                print(222);
                                mainModel.isLogin = true;
                                main.setData(mainModel);
                              },
                              ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(''),
                          ),
                        
                          Padding(
                            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.1, top: 10.0),
                            child: ButtomText(text: '注册账户',textColor: Colors.blue, focusColor: Colors.grey, result: () {
                              print(111);
                            },),
                          )
                          
                        ],
                      ),

                   

                     
                     
                
                    ],
                  ),
                ),
              ),
              // Offstage(
              //   offstage: !vm.isButtonShow,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height,
              //     color: Color.fromRGBO(0, 0, 0, .1),

              //   ),
              // ),
              Offstage(
                 offstage: !vm.isModel,
                child: TextModel(title: vm.modelText,),
              )
              

            ],
          ),
         
        );

      },
    );
   
  }
}


class CircleProgressBarPainter extends CustomPainter {
 


  @override
  void paint(Canvas canvas, Size size) {
    double progressBar = 30.0;
    final paint = new Paint()
      ..color = Colors.grey[400]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;
    final double wh = math.max(size.width, size.height);
    final centerX = (size.width - wh) / 2.0,
        centerY = (size.height - wh) / 2.0;
    final radius = wh / 2.0;
    canvas.drawPath(getArcPath(centerX, centerY, radius, true), paint);
    paint.color = Colors.red;
    canvas.drawPath(getArcPath(centerX, centerY, radius, false,  progressBar), paint);
    
  }

  ///
  /// 获取Arc的Path
  /// <pre>
  /// centerX 圆心坐标x
  /// centerY 圆心坐标Y
  /// isClosePath 是否闭合路径
  /// arcAngle 角度，默认为360°
  ///
  /// 说明：下面代码中使用了一个数学公式
  /// 已知圆心坐标(x, y)，半径(r)，和角度(a)，求圆上某个点的坐标，则有：
  /// x1 = x + r * cos(a * π / 180.0)
  /// y1 = y + r * sin(a * π / 180.0)
  /// </pre>
  ///
  Path getArcPath(
      double centerX, double centerY, double radius, bool isClosePath, [double arcAngle = 360.0]) {
    var path = Path();
    for (double i = 0.0; i < arcAngle; i += 0.1) {
      double x = centerX + radius * math.cos(i * 3.141592653 / 180);
      double y = centerY / 2.0 + radius * math.sin(i * 3.141592653 / 180);
      if (i != 0)
        path.lineTo(x, y);
      else
        path.moveTo(x, y);
    }
    if (isClosePath) path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

