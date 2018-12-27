import 'package:flutter/material.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/main_bloc.dart';
import 'package:app/model/main_model.dart';
import 'package:app/ui/home/index.dart';
import 'package:app/ui/login/index.dart';
import 'package:app/libs/util.dart';
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
          return result.isLogin ? Home(mainModel: result) : Login(mainModel: result);
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
      body: IconButton(
        icon: Icon(Icons.g_translate),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}




