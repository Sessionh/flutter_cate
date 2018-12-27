class MainModel {
  bool isLogin;
  String userName; 

  MainModel({
    this.isLogin,
    this.userName,
  });
  
  MainModel.initData({
    this.isLogin: true,
    this.userName: '小四',
  });
}