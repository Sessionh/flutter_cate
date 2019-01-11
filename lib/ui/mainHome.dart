import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/ui/home/index.dart';
import 'package:app/model/main_model.dart';
import 'package:app/ui/note/node.dart';



class MainHome extends StatefulWidget {
   final MainModel mainModel;
  MainHome({Key key, @required this.mainModel}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new MainHomeState();
}

class MainHomeState extends State<MainHome> {
  final appBarTitles = ['首页', '笔记', '发现', '我的'];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final scaffoldKey = GlobalKey<ScaffoldState>();
  

  int _tabIndex = 0;

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
      Home(mainModel: widget.mainModel,),
      new TweetsListPage(),
      new Node(),
      new MyInfoPage()
    ];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    _body = new IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return  new Scaffold(
        // key: scaffoldKey,
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
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState((){
              _tabIndex = index;
            });
           
              // scaffoldKey.currentState.showSnackBar(new SnackBar(
              //   content: new Text('33')
              // ));
          },
        ),
      );
  }
}

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Text('33'),
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
      )
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

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Text('55')
        ],
      ),
    );
  }
}


class MyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Text('66')
        ],
      ),
    );
  }
}
