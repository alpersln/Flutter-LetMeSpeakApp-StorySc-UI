import 'package:flutter/material.dart';

class StoryPersonModel {
  final Icon profileIcon;
  final String starAmount;
  final Offset location;
  final Offset destination;
  final Color borderColor;

  StoryPersonModel({
    required this.profileIcon,
    required this.starAmount,
    required this.location,
    required this.destination,
    required this.borderColor,
  });
}

class StoryPersonDummyData {
  final List<StoryPersonModel> storyPersonList = [
    StoryPersonModel(
      profileIcon: const Icon(Icons.support_agent, size: 40),
      starAmount: "3/3",
      location: const Offset(250, 100),
      destination: const Offset(100, 220),
      borderColor: Colors.yellowAccent,
    ),
    StoryPersonModel(
      profileIcon: const Icon(Icons.face, size: 40),
      starAmount: "2/3",
      location: const Offset(100, 220),
      destination: const Offset(340, 420),
      borderColor: Colors.white,
    ),
    StoryPersonModel(
      profileIcon: const Icon(Icons.engineering, size: 40),
      starAmount: "1/3",
      location: const Offset(300, 420),
      destination: const Offset(50, 600),
      borderColor: Colors.blueAccent,
    ),
    StoryPersonModel(
      profileIcon: const Icon(Icons.sentiment_very_satisfied, size: 40),
      starAmount: "3/3",
      location: const Offset(50, 600),
      destination: const Offset(300, 750),
      borderColor: Colors.purpleAccent,
    ),
    StoryPersonModel(
      profileIcon: const Icon(Icons.face_retouching_natural, size: 40),
      starAmount: "0/3",
      location: const Offset(300, 750),
      destination: const Offset(50, 900),
      borderColor: Colors.orangeAccent,
    ),
    StoryPersonModel(
      profileIcon: const Icon(Icons.face_unlock_sharp, size: 40),
      starAmount: "2/3",
      location: const Offset(50, 900),
      destination: const Offset(50, 900),
      borderColor: Colors.indigoAccent,
    ),
  ];
}
