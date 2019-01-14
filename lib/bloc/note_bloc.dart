import 'package:app/bloc/bloc_provider.dart';
import 'package:app/model/note_model.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:dio/dio.dart';

class NodeBloc implements BlocBase {
  PublishSubject<NodeModel> _mainController = PublishSubject<NodeModel>();

  Sink<NodeModel> get _inList => _mainController.sink;

  Stream<NodeModel> get outList => _mainController.stream;

   

  @override
  void dispose() {
    _mainController.close();
  }

   setData(vm) {
    NodeModel main = new NodeModel(
      pageNumber: vm.pageNumber,
      isThat: vm.isThat,
    );
    _inList.add(main);
  }

  

  

  

  
}
