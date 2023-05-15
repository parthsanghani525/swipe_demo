import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_swipe_demo/utility/constant/swipe_enum.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeController extends GetxController {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  List<String> names = [
    'Andrews',
    'Master G',
    'Cristine',
    'Grammys',
    'Alex GH'
  ];
  List<String> basicTitle = [
    "156 cm",
    "Sometimes",
    "In College",
    "Women",
    "Jain",
  ];

  List<IconData> basicIcon = [
    Icons.scale,
    Icons.sports_gymnastics,
    Icons.person,
    Icons.female,
    Icons.percent,
  ];

  List images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
    'assets/images/image4.jpeg',
    'assets/images/image5.jpeg',
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  int? selectedIndex;

  getIndex(index) {
    selectedIndex = index;
    update();
  }
}
