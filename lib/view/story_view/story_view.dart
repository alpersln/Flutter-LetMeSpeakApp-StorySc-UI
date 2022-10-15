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
        floatingActionButton: const CustomFloatingButton(),
        body: ListView(
          children: [
            Stack(
              children: [
                backgroundImage(),
                const StarCountCardWidget(starCount: StringConstants.starCount),
                levelAndStarProgressWidget(context),
                for (var model in data.storyPersonList)
                  Positioned(
                    left: model.location.dx - 20,
                    top: model.location.dy - 20,
                    child: Column(
                      children: [
                        circularStoryPerson(model),
                        StarCountCardWidget(
                          starCount: model.starAmount.toString(),
                        )
                      ],
                    ),
                  ),
                CustomPaint(size: const Size(300, 300), painter: MyPainter())
              ],
            )
          ],
        ));
  }

  Container circularStoryPerson(StoryPersonModel model) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.indigo[100],
        border: Border.all(
          color: model.borderColor,
          width: 4,
        ),
      ),
      height: 65,
      width: 65,
      child: model.profileIcon,
    );
  }

  Image backgroundImage() {
    return Image.asset(
      ImageConstants.cloudyLandscape,
      fit: BoxFit.cover,
    );
  }

  Row levelAndStarProgressWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              StringConstants.level,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
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
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize,
                          color: AppColors.textColorBlack,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(
          Icons.my_location_outlined,
          color: Colors.black,
        ),
        onPressed: () {});
  }
}

class StarCountCardWidget extends StatelessWidget {
  final String starCount;
  const StarCountCardWidget({
    Key? key,
    this.starCount = StringConstants.starCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  starCount,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
              dashArray: CircularIntervalList<double>(<double>[9.0, 4.5])),
          paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
