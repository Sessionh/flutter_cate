import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/home_bloc.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/model/home_model.dart';
import 'package:app/libs/util.dart';
import 'package:app/common/pulltorefresh.dart';
import 'home_head.dart';
import 'home_swigger.dart';
import 'home_icons.dart';
import 'home_list_horizontal.dart';
import 'foot_look.dart';

class HomeApp extends StatelessWidget {
  final MainModel mainModel;
  HomeApp({Key key,this.mainModel});
  
  
  @override
  Widget build(BuildContext context) {
    final MainBloc main = BlocProvider.of<MainBloc>(context);
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
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
              mainModel.isLogin = false;
              main.setData(mainModel);
              //  Navigator.pushNamed(context, 'web');
              
             

            },
            child:  Icon(Icons.g_translate),
          ),
        )
      
      ];
      
    
    return StreamBuilder(
      initialData: HomeModel.initData(),
      stream: bloc.outList,
      builder: (BuildContext context2, AsyncSnapshot<HomeModel> snap){
        var vm = snap.data;

        return Scaffold(
          body: Container(
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
                        Pulltorefresh(
                          data: data,
                          height: MediaQuery.of(context).size.height - 142.0,
                          headerResult: (ev) {
                            Util.setTimeOut(800, () {
                              ev.sendBack(true, 3);
                              return false;
                            });
                          },
                          footerResult: (ev) {
                            Util.setTimeOut(800, () {
                              ev.sendBack(false, 7);
                              return false;
                            });
                          },
                        )

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

