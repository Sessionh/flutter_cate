import 'package:app/bloc/bloc_provider.dart';
import 'package:app/model/main_model.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:dio/dio.dart';

class MainBloc implements BlocBase {
  PublishSubject<MainModel> _mainController = PublishSubject<MainModel>();

  Sink<MainModel> get _inList => _mainController.sink;

  Stream<MainModel> get outList => _mainController.stream;

   

  @override
  void dispose() {
    _mainController.close();
  }

   setData(vm) {
    MainModel main = new MainModel(
      isLogin: vm.isLogin, 
      userName: vm.userName,
      tabIndex: vm.tabIndex,
    );
    _inList.add(main);
  }

  

  

  

  
}
