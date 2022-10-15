import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:path_drawing/path_drawing.dart';

class StoryView extends StatelessWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 254, 255),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.my_location_outlined,
              color: Colors.black,
            ),
            onPressed: () {}),
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/cloudy-landscape.jpeg',
                  fit: BoxFit.cover,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              "18",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      elevation: 2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Bölüm 2",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.orange,
                                elevation: 8,
                                fixedSize: Size(150, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: Color.fromARGB(1000, 255, 233, 56)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  "18/50",
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .fontSize,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 1.3,
                  top: MediaQuery.of(context).size.height / 2,
                  child: Container(
                    color: Colors.red,
                    height: 55,
                    width: 55,
                    child: const Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 5,
                  top: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Colors.green,
                    height: 55,
                    width: 55,
                    child: const Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),
                ),
                CustomPaint(
                  size: Size(300, 300),
                  painter: MyPainter(),
                )
              ],
            )
          ],
        ));
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class

  // @override
  // void paint(Canvas canvas, Size size) {
  //   final pointMode = ui.PointMode.polygon;
  //   //PointMode.lines ---  PointMode.polygon  ---- PointMode.points
  //   final p1 = Offset(50, 50);
  //   final p2 = Offset(250, 150);
  //   final p3 = Offset(350, 90);
  //   final points = [
  //     Offset(50, 900),
  //     Offset(300, 750),
  //     Offset(50, 600),
  //     Offset(340, 420),
  //     Offset(100, 220),
  //     Offset(300, 120),
  //   ];
  //   final paint = Paint()
  //     ..color = Colors.black38
  //     ..strokeWidth = 4
  //     ..strokeCap = StrokeCap.round;
  //   canvas.drawPoints(pointMode, points, paint);

  //   // canvas.drawLine(p1, p2, paint);
  //   // canvas.drawLine(points[0], points[1], paint);
  // }

  @override
  void paint(Canvas canvas, Size size) {
    // final path = Path()
    //   ..moveTo(300, 120)

    //   ..quadraticBezierTo(300, 10, 100, 220)
    //   ..quadraticBezierTo(100, 220, 340, 420)

    //   ..quadraticBezierTo(340, 420, 50, 600)
    //   ..quadraticBezierTo(50, 600, 300, 750)
    //   ..quadraticBezierTo(300, 750, 50, 900);

    var paint = Paint();

    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(300, 120);
    var controlPoint1 = Offset(260, 250);
    var controlPoint2 = Offset(222, 220);
    var endPoint = Offset(100, 220);
//for loop start points
// and end points
    final startPoints = [
      Offset(300, 120),
      Offset(100, 220),
      Offset(340, 420),
      Offset(50, 600),
      Offset(300, 750),
    ];
    final endPoints = [
      Offset(100, 220),
      Offset(340, 420),
      Offset(50, 600),
      Offset(300, 750),
      Offset(50, 900),
    ];

    endPoints.asMap().forEach((i, value) {
      var path = Path();
      path.moveTo(startPoints[i].dx, startPoints[i].dy);
      path.cubicTo(
        startPoints[i].dx,
        startPoints[i].dy,
        (startPoints[i].dx + endPoints[i].dx) / 2,
        (startPoints[i].dy + endPoints[i].dy) / 3,
        endPoints[i].dx,
        endPoints[i].dy,
      );

      canvas.drawPath(
          dashPath(path,
              dashArray: CircularIntervalList<double>(<double>[6.0, 4.5])),
          paint);
    });
//---------------------------
    // var path = Path();
    // path.moveTo(startPoint.dx, startPoint.dy);
    // path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
    //     controlPoint2.dy, endPoint.dx, endPoint.dy,);

    // canvas.drawPath(
    //     dashPath(path,
    //         dashArray: CircularIntervalList<double>(<double>[6.0, 4.5])),
    //     paint);
    //---------- i      ------

    // final paint = Paint()
    //   ..color = Colors.black
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 4;
    // canvas.drawPath(path, paint);
  }
  // final paint = Paint()
  //   ..color = Colors.black
  //   ..style = PaintingStyle.stroke
  //   ..strokeWidth = 4;
  // canvas.drawPath(path, paint);

// @override
// void paint(Canvas canvas, Size size) {
//   final rect = Rect.fromLTRB(50, 100, 250, 200);
//   final startAngle = -math.pi / 2;
//   final sweepAngle = math.pi;
//   final useCenter = false;
//   final paint = Paint()
//     ..color = Colors.black
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 4;
//   canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
// }
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
