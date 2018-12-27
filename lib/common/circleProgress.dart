import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class CircleProgress extends StatefulWidget {
  final double width;
  final double height;
  CircleProgress({Key key, this.width, this.height});
  CircleProgressApp createState() => new CircleProgressApp();

}
class CircleProgressApp extends State<CircleProgress> with SingleTickerProviderStateMixin{

  AnimationController _container;
  // CircleProgressBarTween circle;
    Animation<double> radiusA;  
    
  

  @override
  void initState() {
      _container = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
    
      
       radiusA = new Tween(begin: 30.0, end: 300.0).animate(_container);
      _container.forward();
      super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
      size: const Size(60.0, 60.0),
      painter: new CircleProgressBarPainter(radiusA),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  CircleProgressBarPainter(Animation<double> animation)
      : animation = animation,
        super(repaint: animation);

  Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final progressBar = animation.value;
    final paint = new Paint()
      ..color = Colors.grey[400]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;
    final double wh = math.max(size.width, size.height);
    final centerX = (size.width - wh) / 2.0,
        centerY = (size.height - wh) / 2.0;
    final radius = wh / 2.0;
    canvas.drawPath(getArcPath(centerX, centerY, radius, true), paint);
    paint.color = Colors.red;
    canvas.drawPath(getArcPath(centerX, centerY, radius, false, progressBar), paint);
  }

  ///
  /// 获取Arc的Path
  /// <pre>
  /// centerX 圆心坐标x
  /// centerY 圆心坐标Y
  /// isClosePath 是否闭合路径
  /// arcAngle 角度，默认为360°
  ///
  /// 说明：下面代码中使用了一个数学公式
  /// 已知圆心坐标(x, y)，半径(r)，和角度(a)，求圆上某个点的坐标，则有：
  /// x1 = x + r * cos(a * π / 180.0)
  /// y1 = y + r * sin(a * π / 180.0)
  /// </pre>
  ///
  Path getArcPath(
      double centerX, double centerY, double radius, bool isClosePath, [double arcAngle = 360.0]) {
    var path = Path();
    for (double i = 0.0; i < arcAngle; i += 0.1) {
      double x = centerX + radius * math.cos(i * 3.141592653 / 180);
      double y = centerY / 2.0 + radius * math.sin(i * 3.141592653 / 180);
      if (i != 0)
        path.lineTo(x, y);
      else
        path.moveTo(x, y);
    }
    if (isClosePath) path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class CircleProgressBar {
  CircleProgressBar(this.progress, {this.min = 0.0, this.max = 100.0});

  double progress;

  double min;

  double max;

  static CircleProgressBar lerp(
      CircleProgressBar begin, CircleProgressBar end, double t) {
    return new CircleProgressBar(lerpDouble(begin.progress, end.progress, t));
  }

  
}

class CircleProgressBarTween extends Tween<CircleProgressBar> {
  CircleProgressBarTween(CircleProgressBar begin, CircleProgressBar end)
      : super(begin: begin, end: end);

  @override
  CircleProgressBar lerp(double t) => CircleProgressBar.lerp(begin, end, t);
}