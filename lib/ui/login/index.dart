import 'package:flutter/material.dart';
import 'login.dart';
import 'package:app/model/main_model.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/login_bloc.dart';

class Login extends StatefulWidget {
  final MainModel mainModel;
  Login({Key key, @required this.mainModel}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<Login>
    with TickerProviderStateMixin {
  AnimationController loginButtonController;
  @override
  void initState() {
    super.initState();
    loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    loginButtonController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<LoginBloc>(
      bloc: LoginBloc(),
      child: LoginApp(widget.mainModel, loginButtonController)
      // child: MyApp111(),
    );
  }
}
