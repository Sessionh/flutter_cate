import 'package:flutter/material.dart';
import 'home.dart';
import 'package:app/model/main_model.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";

class Home extends StatefulWidget {
  final MainModel mainModel;
  final scaffoldKey;
  
  Home({Key key, @required this.mainModel,  this.scaffoldKey}) : super(key: key);
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home>
    with TickerProviderStateMixin {
  AnimationController customBoxWaitAnimation;
  RefreshController refreshController;

  @override
  void initState() {
    refreshController = new RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    customBoxWaitAnimation.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    
    return BlocProvider<HomeBloc>(
      bloc: HomeBloc(),
      child: HomeApp(
        mainModel: widget.mainModel,
        refreshController: refreshController,
        scaffoldKey: widget.scaffoldKey,
      ),
    );
  }
}
