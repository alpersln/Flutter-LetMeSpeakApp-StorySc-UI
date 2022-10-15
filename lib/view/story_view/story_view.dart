import 'package:flutter/material.dart';
import 'package:flutter_letmespeakapp_story_ui/constants/color_constants.dart';
import 'package:flutter_letmespeakapp_story_ui/constants/image_constants.dart';
import 'package:flutter_letmespeakapp_story_ui/constants/string_constants.dart';
import 'package:flutter_letmespeakapp_story_ui/model/story_person_model.dart';

import 'package:path_drawing/path_drawing.dart';

class StoryView extends StatelessWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StoryPersonDummyData data = StoryPersonDummyData();

    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.my_location_outlined,
              color: Colors.black,
            ),
            onPressed: () {}),
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  ImageConstants.cloudyLandscape,
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              StringConstants.starCount,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          StringConstants.level,
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
                                fixedSize: const Size(150, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: AppColors.elevatedButtonYellowColor),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.starIconYellowColor,
                                ),
                                Text(
                                  StringConstants.starProgress,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .fontSize,
                                      color: AppColors.textColorBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
                for (var model in data.storyPersonList)
                  Positioned(
                    left: model.location.dx,
                    top: model.location.dy,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      height: 55,
                      width: 55,
                      child: model.profileIcon,
                    ),
                  ),
                // Positioned(
                //   left: MediaQuery.of(context).size.width / 1.3,
                //   top: MediaQuery.of(context).size.height / 2,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.red,
                //     ),
                //     height: 55,
                //     width: 55,
                //     child: const Icon(
                //       Icons.person,
                //       size: 55,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: MediaQuery.of(context).size.width / 5,
                //   top: MediaQuery.of(context).size.height / 6,
                //   child: Container(
                //     height: 55,
                //     width: 55,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.green,
                //     ),
                //     child: const Icon(
                //       Icons.person,
                //       size: 55,
                //     ),
                //   ),
                // ),
                CustomPaint(
                  size: const Size(300, 300),
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
  final StoryPersonDummyData data = StoryPersonDummyData();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = AppColors.pathPaintColor;
    ;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    data.storyPersonList.asMap().forEach((i, person) {
      var path = Path();
      path.moveTo(person.location.dx, person.location.dy);
      path.cubicTo(
        person.location.dx,
        person.location.dy,
        (person.location.dx + person.destination.dx) / 2,
        (person.location.dy + person.destination.dy) / 3,
        person.destination.dx,
        person.destination.dy,
      );

      canvas.drawPath(
          dashPath(path,
              dashArray: CircularIntervalList<double>(<double>[6.0, 4.5])),
          paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
