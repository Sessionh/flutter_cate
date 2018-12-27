import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/model/home_model.dart';
import 'package:app/common/slide_container.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/libs/util.dart';
import 'home_head.dart';
import 'duleRun.dart';

class HomeApp extends StatelessWidget {
  final MainModel mainModel;
  final RefreshController refreshController;
  HomeApp({Key key,this.mainModel, this.refreshController});
  
  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();
    Util.setUIStyle(false);
     List<Widget> data = [
          Text('332'),
          Text('335'), 
          Text('334'),
          Text('334'),
          Text('334'),
          Text('334'),
          Text('334'),
          Text('334'),
          SpinKitDualRing1(color: Colors.black,)
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height - 182.0
          // )
        ];
    Widget _buildHeader(context,mode){
      print(mode);
      return mode == 1? SpinKitWave(size: 30.0, color: Colors.black,): Icon(Icons.add_alarm);
      
      // new ClassicIndicator(
      //   mode: mode, 
      //   textStyle: TextStyle(color: Colors.grey),
      //   refreshingText: '刷新',
      //   releaseText: '松手',
      //   idleText: '下拉刷新',
      // );
    }
    return StreamBuilder(
      initialData: HomeModel.initData(),
      stream: bloc.outList,
      builder: (BuildContext context2, AsyncSnapshot<HomeModel> snap){
        var vm = snap.data;
       

        return Scaffold(
          key: scaffoldKey,
          body:
                Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      HomeHead(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0.1,
                        color: Colors.black
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 92.0,
                        // color: Colors.grey,
                        child: SmartRefresher(
                          controller: refreshController,
                          enablePullDown: true,
                          enablePullUp: true,
                          headerBuilder: _buildHeader,
                          headerConfig: RefreshConfig(
                            triggerDistance: 80.0,
                          ),
                          onRefresh: (ev) {
                            if (ev) {
                               Util.setTimeOut(800, () {
                                  print('测试');
                                  refreshController.sendBack(true, 3);
                                  return false;

                              });

                            } else {
                              Util.setTimeOut(800, () {
                                  print('测试1');
                                  refreshController.sendBack(false, 2);
                                  return false;

                              });
                            }

                           

                          },
                          
                          onOffsetChange:  (type, value,{id}) {
                              print(value);
                              if (type) {
                                print('上啦');

                              } else {
                                 print('下啦');
                                
                              }
                              
                          
                          },
                          child: ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20.0),
                            children: data,
                          )
                    ),
                      )
                      

                    ],
                  )
                 

                ],
              ),
                  
        );

      },
    );
    
   
  }

 
}

