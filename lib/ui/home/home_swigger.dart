import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwigger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GestureDetector> listImage = [
      GestureDetector(
        child:  Image.network("http://source.qunarzz.com/site/images/wns/20181227_qunar_homepage_dujia_6.jpg",fit: BoxFit.fill,),
        onTap: () {
          print(1);
        }
      ),
      GestureDetector(
        child:   Image.network("http://source.qunarzz.com/site/images/wns/20181229_dujia_homepage_2.jpg",fit: BoxFit.fill,),
        onTap: () {
          print(2);
        }
      ),
      GestureDetector(
        child:  Image.network("https://imgs.qunarzz.com/p/tts2/1804/e5/3f79a9a0ce3ffd02.jpg_r_240x160x90_fa3e9858.jpg",fit: BoxFit.fill,),
        onTap: () {
          print(3);
        }
      ),
     
     
      
    ];
    return Container(
      height: 200.0,
      padding: EdgeInsets.only(top: 0.0),
      child:   new Swiper(
        itemBuilder: (BuildContext context,int index){
          return listImage[index];
        },
        autoplay: true, // 自动轮播
        viewportFraction: 0.85,
        scale: 0.9,
        itemCount: listImage.length,

        pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
    
   
  }
}