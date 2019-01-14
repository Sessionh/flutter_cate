import 'package:flutter/material.dart';
import 'package:app/libs/util.dart';
import 'package:app/common/pulltorefresh.dart';
import 'node_head.dart';
import 'package:app/bloc/bloc_provider.dart';
import 'package:app/bloc/note_bloc.dart';
import 'package:app/model/note_model.dart';
import "package:app/common/flutter_pulltorefresh/pull_to_refresh.dart";

class Node extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NodeBloc>(
      bloc: NodeBloc(),
      child: NodeState()
    );
  }
}

class NodeState extends StatefulWidget {
  NodeBlocState createState() => new NodeBlocState();

}
class NodeBlocState extends State<NodeState> {
  RefreshController refreshController;

  @override
  void initState() {
    refreshController = new RefreshController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final NodeBloc bloc = BlocProvider.of<NodeBloc>(context);
    List<Widget> data = [
      Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: 40.0,
                color: Colors.green,
                child: Text('33'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('55'),
            ),  
            Expanded(
              flex: 1,
              child: Text('66'),
            )
           
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.0),
        height: 300.0,
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        height: 300.0,
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        height: 300.0,
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
      ),

    ];
    List<Widget> data1 = [
      Container(
        margin: EdgeInsets.only(top: 20.0),
        height: 300.0,
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        height: 300.0,
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
      ),
      Container(
        height: 300.0,
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
      ),
      GestureDetector(
        onTap: () {
          refreshController.sendBack(true, 2);
          refreshController.scrollTo(-60.0);
        },
        child: Text('点击'),

      )

    ];
    List pages = [data, data1];
   
  return StreamBuilder(
      initialData: NodeModel.initData(),
      stream: bloc.outList,
      builder: (BuildContext context2, AsyncSnapshot<NodeModel> snap){
        var vm = snap.data;
       

      
        return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  NodeHead(
                    isThat: vm.isThat,
                    
                    result: (val) {
                      if (val == 0) {
                        vm.isThat = true;

                      } else {
                        vm.isThat = false;
                        refreshController.sendBack(true, 2);
                        refreshController.scrollTo(-60.0);
                      }
                      vm.pageNumber = val;
                      bloc.setData(vm);

                  },),
                  Pulltorefresh(
                    controller: refreshController,
                    data: pages[vm.pageNumber],
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
                    // controller: null,
                  )
                  
                  
                ],
              ),
            )
        );
      });
    
  
    
     
  }

}

