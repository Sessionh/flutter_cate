import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SpinKitDualRing1 extends StatefulWidget {
  final Color color;
  final double size;

  const SpinKitDualRing1({
    Key key,
    @required this.color,
    this.size = 50.0,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  @override
  _SpinKitDualRingState createState() => _SpinKitDualRingState();
}

class _SpinKitDualRingState extends State<SpinKitDualRing1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.identity()
      ..rotateZ((_animation1.value) * math.pi * 2);
    return Center(
      child: Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: CustomPaint(
          child: Container(
            height: widget.size,
            width: widget.size,
          ),
          painter: _DualRingPainter(color: widget.color),
        ),
      ),
    );
  }
}

class _DualRingPainter extends CustomPainter {
  Paint p = Paint();
  final double weight;

  _DualRingPainter({this.weight = 90.0, Color color}) {
    p.color = color;
    p.strokeWidth = 10.0;
    p.style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
      0.0,
      getRadian(weight),
      false,
      p,
    );
    canvas.drawArc(
      Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
      getRadian(180.0),
      getRadian(weight),
      false,
      p,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double getRadian(double angle) {
    return math.pi / 180 * angle;
  }
}