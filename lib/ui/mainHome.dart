import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/ui/home/index.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/ui/note/node.dart';
import 'package:app/ui/user/user.dart';
import 'package:app/ui/shopping/shopping_city.dart';
import 'package:app/ui/video/video.dart';


class MainHome extends StatefulWidget {
   final MainModel mainModel;
  MainHome({Key key, @required this.mainModel}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new MainHomeState();
}

class MainHomeState extends State<MainHome> {
  final List<String> appBarTitles = ['首页', '课堂', '笔记', '商场', '我的'];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final scaffoldKey = GlobalKey<ScaffoldState>();
  

  // int _tabIndex = 0;

  var tabImages;
  var _body;
  var pages;

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      new Home(mainModel: widget.mainModel,),
      new Video(),
      new Node(),
      new Shopping(),
      new Users(),
    
    ];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/home.png'),
          getTabImage('images/homeS.png')
        ],
        [
          getTabImage('images/video.png'),
          getTabImage('images/videoS.png')
        ],
        [
          getTabImage('images/note.png'),
          getTabImage('images/noteS.png')
        ],
        [
          getTabImage('images/shopping.png'),
          getTabImage('images/shoppingS.png')
        ],
        [
          getTabImage('images/my.png'),
          getTabImage('images/myS.png')
        ],
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == widget.mainModel.tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == widget.mainModel.tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    _body = new IndexedStack(
      children: pages,
      index: widget.mainModel.tabIndex,
    );
    return  new Scaffold(
        key: scaffoldKey,
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2),
                title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3),
                title: getTabTitle(3)),
             new BottomNavigationBarItem(
                icon: getTabIcon(4),
                title: getTabTitle(4)),
          ],
          currentIndex: widget.mainModel.tabIndex,
          onTap: (index) {
            widget.mainModel.tabIndex = index;
            main.setData(widget.mainModel);
          },
        ),
      );
  }
}

class TweetsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Text('44'),
           Padding(
            padding: EdgeInsets.only(top: 30.0),
            child:  GestureDetector(
              onTap: () {
               Navigator.pushNamed(context, 'web');

              },
              child: Icon(Icons.gesture),
            ),
          )
        ],
      ),
    );
  }
}