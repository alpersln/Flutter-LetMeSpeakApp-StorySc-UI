import 'package:flutter/material.dart';

class StoryPersonModel {
  final Icon profileIcon;
  final int starAmount;
  final Offset location;
  final Offset destination;

  StoryPersonModel({
    required this.profileIcon,
    required this.starAmount,
    required this.location,
    required this.destination,
  });
}

class StoryPersonDummyData {
  final List<StoryPersonModel> storyPersonList = [
    StoryPersonModel(
        profileIcon: const Icon(
          Icons.person,
          size: 55,
        ),
        starAmount: 3,
        location: const Offset(300, 120),
        destination: const Offset(100, 220)),
    StoryPersonModel(
        profileIcon: const Icon(
          Icons.person,
          size: 55,
        ),
        starAmount: 2,
        location: const Offset(100, 220),
        destination: const Offset(340, 420)),
    StoryPersonModel(
        profileIcon: const Icon(
          Icons.person,
          size: 55,
        ),
        starAmount: 1,
        location: const Offset(340, 420),
        destination: const Offset(50, 600)),
    StoryPersonModel(
        profileIcon: const Icon(
          Icons.person,
          size: 55,
        ),
        starAmount: 3,
        location: const Offset(50, 600),
        destination: const Offset(300, 750)),
    StoryPersonModel(
        profileIcon: const Icon(
          Icons.person,
          size: 55,
        ),
        starAmount: 0,
        location: const Offset(300, 750),
        destination: const Offset(50, 900)),
    StoryPersonModel(
        profileIcon: const Icon(
          Icons.person,
          size: 55,
        ),
        starAmount: 0,
        location: const Offset(50, 900),
        destination: const Offset(50, 900)),
  ];
}
