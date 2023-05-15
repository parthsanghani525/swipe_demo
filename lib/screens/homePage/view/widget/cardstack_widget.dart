import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_swipe_demo/screens/homePage/controller/home_controller.dart';
import 'package:image_swipe_demo/screens/homePage/view/widget/action_widget.dart';
import 'package:image_swipe_demo/screens/homePage/view/widget/card_widget.dart';
import 'package:image_swipe_demo/utility/constant/swipe_enum.dart';

class CardStackWidget extends StatefulWidget {
  const CardStackWidget({Key? key}) : super(key: key);

  @override
  State<CardStackWidget> createState() => _CardStackWidgetState();
}

class _CardStackWidgetState extends State<CardStackWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.images.removeLast();
        _animationController.reset();
        controller.swipeNotifier.value = Swipe.none;
      }
    });
    controller.getIndex(controller.images.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (homeController) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ValueListenableBuilder(
                  valueListenable: controller.swipeNotifier,
                  builder: (context, swipe, _) => Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: List.generate(controller.images.length, (index) {
                      if (index == controller.images.length - 1) {
                        return PositionedTransition(
                          rect: RelativeRectTween(
                            begin: RelativeRect.fromSize(
                                const Rect.fromLTWH(0, 0, 580, 340),
                                const Size(580, 340)),
                            end: RelativeRect.fromSize(
                                Rect.fromLTWH(
                                    swipe != Swipe.none
                                        ? swipe == Swipe.left
                                            ? -300
                                            : 300
                                        : 0,
                                    0,
                                    580,
                                    340),
                                const Size(580, 340)),
                          ).animate(CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeInOut,
                          )),
                          child: RotationTransition(
                            turns: Tween<double>(
                                    begin: 0,
                                    end: swipe != Swipe.none
                                        ? swipe == Swipe.left
                                            ? -0.1 * 0.3
                                            : 0.1 * 0.3
                                        : 0.0)
                                .animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve: const Interval(0, 0.4,
                                    curve: Curves.easeInOut),
                              ),
                            ),
                            child: CardWidget(
                              isRemove: index == controller.selectedIndex,
                              index: index,
                              image: controller.images[index],
                              swipeNotifier: controller.swipeNotifier,
                              isLastCard: true,
                            ),
                          ),
                        );
                      } else {
                        return CardWidget(
                          isRemove: index == controller.selectedIndex,
                          index: index,
                          image: controller.images[index],
                          swipeNotifier: controller.swipeNotifier,
                          isLastCard: false,
                        );
                      }
                    }),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: DragTarget<int>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return IgnorePointer(
                      child: Container(
                        height: 700.0,
                        width: 80.0,
                        color: Colors.transparent,
                      ),
                    );
                  },
                  onAccept: (int index) {
                    setState(() {
                      controller.images.removeAt(index);
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return actionDialog('NO');
                      },
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                child: DragTarget<int>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return IgnorePointer(
                      child: Container(
                        height: 700.0,
                        width: 80.0,
                        color: Colors.transparent,
                      ),
                    );
                  },
                  onAccept: (int index) {
                    setState(() {
                      controller.images.removeAt(index);
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return actionDialog('YES');
                      },
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}
