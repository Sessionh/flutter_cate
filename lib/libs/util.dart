import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
class Util{

     // 延迟函数
     Util.setTimeOut(int time, [Function result]){ // 1.延迟时间 毫秒  2.返回函数
       Future.delayed(new Duration(milliseconds: time),result);
       
     }
     Util.setUIStyle(bool type) { // 设置 app 最上面 时间 电池 颜色
       if (type) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(0, 0, 0, 0.0),
            statusBarIconBrightness: Brightness.light,
          ));
       } else {
         
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Color.fromRGBO(0, 0, 0, 0.0),
              statusBarIconBrightness: Brightness.dark,
            )
          );
       }
       
     }
     Util.getCellPhone() {
       getData() async {  
         

          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          if (Platform.isIOS) {
            print('ios');
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
            print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
          } else if (Platform.isAndroid) {
            print('android');
              AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            print('Running on ${androidInfo.brand}');  // e.g. "Moto G (4)"
          }
         
          

          
                    
          }
        getData();
     
     }

     getHeight(context) {
       var _that = MediaQuery.of(context);
      var height =  _that.size.height - _that.padding.bottom - _that.padding.top;
      return height;

     }

}
