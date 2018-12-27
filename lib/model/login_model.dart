class LoginModel {
  String userName;
  String password;
  bool obscureText;
  bool isDarkTheme;
  bool isButtonShow; // 是否加载登陆状态
  bool isModel; // 是否弹出框
  String modelText; // 弹出框 内容

  LoginModel({
    this.userName,
    this.password,
    this.obscureText,
    this.isDarkTheme,
    this.isButtonShow,
    this.isModel,
    this.modelText,
  });

  LoginModel.initDate({
    this.userName: '',
    this.password: '',
    this.obscureText: true,
    this.isDarkTheme: false,
    this.isButtonShow: false,
    this.isModel: false,
    this.modelText: '',
  });
}