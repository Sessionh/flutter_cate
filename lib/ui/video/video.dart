import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  VideoState createState() => new VideoState();
  
}
class VideoState extends State<Video> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom
      ),
      child: Column(
        children: <Widget>[
          Text('Video')
        ],
      ),

    );
  }

}