import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_swipe_demo/screens/homePage/model/home_content_model.dart';
import 'package:image_swipe_demo/utility/constant/string_constant.dart';
import 'package:image_swipe_demo/utility/functions/alertFunction.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeController extends GetxController{
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  List<String> names = [
    'Andrews',
    'Master G',
    'Cristine',
    'Grammys',
    'Alex GH'
  ];
  List<String> basicTitle=[
    "156 cm",
    "Sometimes",
    "In College",
    "Women",
    "Jain",
  ];

  List<IconData> basicIcon=[
    Icons.scale,
    Icons.sports_gymnastics,
    Icons.person,
    Icons.female,
    Icons.percent,

  ];

  List<String> interestTitle=[
    "156 cm",
    "Sometimes",
    "In College",
    "Women",
    "Jain",
  ];

  List images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
    'assets/images/image4.jpeg',
    'assets/images/image5.jpeg',
  ];
  init(BuildContext context){
    for (int i = 0; i < names.length; i++) {
      swipeItems.add(
        SwipeItem(
          content: Content(text: names[i]),
          likeAction: () {
            actions(context, names[i], AppString.like);
          },
          nopeAction: () {
            actions(context, names[i], AppString.reject);
          },
          superlikeAction: () {
            actions(context, names[i], AppString.superLike);
          },
        ),
      );
    }
    matchEngine = MatchEngine(swipeItems: swipeItems);
    update();
  }

}