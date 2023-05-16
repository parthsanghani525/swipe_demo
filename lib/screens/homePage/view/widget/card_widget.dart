import 'package:flutter/material.dart';
import 'package:image_swipe_demo/screens/homePage/view/widget/profile_card.dart';
import 'package:image_swipe_demo/utility/constant/swipe_enum.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final String? image;

  const CardWidget(
      {Key? key,
      required this.index,
      required this.swipeNotifier,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: index,
      axis: Axis.horizontal,
      feedback: Material(
        color: Colors.transparent,
        child: ValueListenableBuilder(
          valueListenable: swipeNotifier,
          builder: (context, swipe, _) {
            return RotationTransition(
              turns: swipeNotifier.value != Swipe.none
                  ? swipeNotifier.value == Swipe.left
                      ? const AlwaysStoppedAnimation(-5 / 360)
                      : const AlwaysStoppedAnimation(5 / 360)
                  : const AlwaysStoppedAnimation(0),
              child: ProfileCard(
                image: image,
                index: index,
              ),
            );
          },
        ),
      ),
      onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
        if (dragUpdateDetails.delta.dx > 0 &&
            dragUpdateDetails.globalPosition.dx >
                MediaQuery.of(context).size.width / 2) {
          swipeNotifier.value = Swipe.right;
        }
        if (dragUpdateDetails.delta.dx < 0 &&
            dragUpdateDetails.globalPosition.dx <
                MediaQuery.of(context).size.width / 2) {
          swipeNotifier.value = Swipe.left;
        }
      },
      onDragEnd: (drag) {
        swipeNotifier.value = Swipe.none;
      },
      childWhenDragging: Container(
        color: Colors.transparent,
      ),
      child: ValueListenableBuilder(
          valueListenable: swipeNotifier,
          builder: (BuildContext context, Swipe swipe, Widget? child) {
            return ProfileCard(
              image: image,
              index: index,
            );
          }),
    );
  }
}
