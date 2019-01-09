import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/ui/home/index.dart';
import 'package:app/ui/login/index.dart';
import 'package:app/libs/util.dart';
import 'package:app/ui/mainHome.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
void main() {
  runApp(BlocProvider<MainBloc>(
    bloc: MainBloc(),
    child: MyApp(),
  )
    
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Util.setUIStyle(false);

    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter bloc',
      home: StreamBuilder(
        stream: bloc.outList,
        initialData: MainModel.initData(),
        builder: (BuildContext context, AsyncSnapshot<MainModel> snapshot) {
          var result = snapshot.data;
          return result.isLogin ? MainHome(mainModel: result) : Login(mainModel: result);
        }

      ),
       routes: {
        "web": (_) => new WebviewScaffold(
          url: "https://juejin.im/",
          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
           withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Container(
            color: Colors.redAccent,
            child: const Center(
              child: Text('Waiting.....'),
            ),
          ),
          
        ),
        "homes":(BuildContext context)=>new SecondPage(),
        
      },
      
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GestureDetector(
          child: Hero(
              tag: 'hero',
              child:  Image.network(
                  'https://i1.douguo.com/upload/note/c/a/0/320_ca47a5a86abe8cdddf025feddaf2f0a0.jpg',
                  height: 100.0,
                  width: 180.0,
                  fit: BoxFit.fill,
                  ),
                ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ElementDetailPage();
            }));
          },
        ),
        IconButton(
          icon: Icon(Icons.g_translate),
          onPressed: () {
            Navigator.of(context).pop();
          },

        )

        ],
      )
      
      
    );
    
    
    
  }
}

class ElementDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
              tag: 'hero',
              child: Image.network(
                    'https://i1.douguo.com/upload/note/c/a/0/320_ca47a5a86abe8cdddf025feddaf2f0a0.jpg',
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 5.0),
              child:  GestureDetector(
                  child: Icon(IconData(0xe617, fontFamily: 'iconfont'), size: 30.0, color: Colors.white,),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
              ),
            )
          

        ],
      )
      
     
    );
    
    
  }
}




