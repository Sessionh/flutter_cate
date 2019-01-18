class MainModel {
  bool isLogin;
  int tabIndex;
  String userName; 

  MainModel({
    this.isLogin,
    this.userName,
    this.tabIndex,
  });
  
  MainModel.initData({
    this.isLogin: true,
    this.userName: '小四',
    this.tabIndex: 0,
  });
}