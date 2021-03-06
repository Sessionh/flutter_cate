import 'package:flutter/material.dart';
import 'home.dart';
import 'package:app/model/main_model.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';

class Home extends StatefulWidget {
  final MainModel mainModel;
  
  Home({Key key, @required this.mainModel}) : super(key: key);
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home>
    with TickerProviderStateMixin {
  AnimationController customBoxWaitAnimation;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (customBoxWaitAnimation != null) {
      customBoxWaitAnimation.dispose();
    }
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: HomeApp(
        mainModel: widget.mainModel,
      ),
    );
  }
}
