import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/model/home_model.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/libs/util.dart';
import 'home_head.dart';
import 'home_swigger.dart';
import 'home_icons.dart';
import 'home_list_horizontal.dart';
import 'foot_look.dart';


class HomeApp extends StatelessWidget {
  final MainModel mainModel;
  final RefreshController refreshController;
  final scaffoldKey;
  HomeApp({Key key,this.mainModel, this.refreshController, this.scaffoldKey});
  
  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    // final scaffoldKey = GlobalKey<ScaffoldState>();
    // final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

    Util.setUIStyle(false);
    List<Widget> data = [
        HomeSwigger(),
        HomeIcons(),
        HomeListHorizontal(),
        FootLook(
          name: 'foot',
          title: '给父母做一份儿时爱吃的“老点心”---桃酥',
          userName: '孔老师学做菜',
          url: 'https://cp1.douguo.com/upload/caiku/2/c/0/260x220_2c668ad4c1b84d6e0711a425477f4ef0.JPG'
        ),
        FootLook(
          name: 'foot1',
          title: '可口的菜肴',
          userName: '小三小北', 
          url: 'https://cp1.douguo.com/upload/caiku/0/c/0/260x220_0cbaaa6036ac960f2146efd3456bd7a0.jpg'
        ),
        Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              // mainModel.isLogin = false;
              // main.setData(mainModel);
              //  Navigator.pushNamed(context, 'web');
               scaffoldKey.currentState.showSnackBar(new SnackBar(
                content: new Text('33')
              ));
             

            },
            child:  Icon(Icons.g_translate),
          ),
        )
      
      ];
      
    Widget _buildHeader(context,mode){
      var str;
      if (mode == 2) {
        str = SpinKitWave(size: 20.0, color: Colors.green,);
      }else if(mode == 1) {
        str = Text('松手刷新');
      } else if (mode == 3){
        str = Text('刷新成功');
      } else if (mode == 4) {
         str = Text('4');
      } else {
        str = Text('下拉刷新');
      }
      return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: str,
      );
      
      // return new ClassicIndicator(
      //   mode: mode, 
      //   textStyle: TextStyle(color: Colors.grey),
      //   refreshingText: '刷新',
      //   releaseText: '松手',
      //   idleText: '下拉刷新',
      //   completeText: '刷新成功',
      // );
    }
    Widget _footerBuilder(context,mode) {
        var str;
       
        if (mode == 6) {
           str = 
           Container(
             height: 40.0,
             width: MediaQuery.of(context).size.width,
             child: Center(
               child: Container(
                 width: 100.0,
                 child:  Row(
                  children: <Widget>[
                    SpinKitCircle(size: 30.0, color: Colors.green,),
                    Text('加载中...')
                  ],
                ),
               ),
             )
             
            
           ) ;
        }  else {
          str = Text('');
        }
        return str;

    }
    return StreamBuilder(
      initialData: HomeModel.initData(),
      stream: bloc.outList,
      builder: (BuildContext context2, AsyncSnapshot<HomeModel> snap){
        var vm = snap.data;
      //  refreshController.sendBack(true, 2);

        return Scaffold(
          body: 
        Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Stack(
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
                        height: MediaQuery.of(context).size.height - 142.0,
                        // color: Colors.grey,
                        child: new SmartRefresher(
                          controller: refreshController,
                          enablePullDown: true,
                          enablePullUp: true,
                          isScrollbar: true,
                          headerBuilder: _buildHeader,
                          footerBuilder: _footerBuilder,
                          headerConfig: RefreshConfig(
                            triggerDistance: 60.0,
                          ),
                          onRefresh: (ev) {
                            if (ev) {
                              Util.setTimeOut(800, () {
                                refreshController.sendBack(true, 3);
                                return false;
                              });

                            } else {
                              Util.setTimeOut(800, () {
                                refreshController.sendBack(false, 7);
                                return false;
                              });
                            }

                           

                          },
                          
                          onOffsetChange:  (type, value,{id}) {
                              if (!type) {
                                 if (value > 10.0) {
                                   refreshController.sendBack(false, 6);
                                 } 
                              }
                          
                          },
                          child: ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0.0),
                            children: data,
                          )
                        ),
                      ),
                      

                    ],
                  ),

                ],
              ),
        ),
        
        );
        
        
        

      },
    );
    
   
  }

 
}

