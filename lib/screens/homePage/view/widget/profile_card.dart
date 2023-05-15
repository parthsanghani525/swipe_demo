import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_swipe_demo/screens/homePage/controller/home_controller.dart';
import 'package:image_swipe_demo/utility/constant/string_constant.dart';
import 'package:image_swipe_demo/utility/constant/swipe_enum.dart';
import 'package:image_swipe_demo/utility/widgets/custom_container.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key, this.image, this.index}) : super(key: key);
  final String? image;
  final int? index;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        initState: (state) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            controller.getIndex(widget.index);
          });
        },
        builder: (homeController) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: widget.index == controller.selectedIndex
                        ? Border.all(
                            color: controller.swipeNotifier.value == Swipe.right
                                ? Colors.green
                                : controller.swipeNotifier.value == Swipe.left
                                    ? Colors.red
                                    : Colors.transparent,
                            width: 3)
                        : const Border()),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.16,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(widget.image!),
                            fit: BoxFit.fill,
                          )),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey),
                                child: const Icon(Icons.upload),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    AppString.numberMark,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: const Color(0xffF7D060)),
                                    child: const Icon(
                                      Icons.chat,
                                      size: 22,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffF7D060)),
                                child: const Icon(
                                  Icons.star,
                                  size: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.yellow.shade50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppString.basic,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: List.generate(
                              homeController.basicTitle.length,
                              (index) => CustomContainer.customContainer
                                  .commonContainer(
                                      customIcon:
                                          Icon(homeController.basicIcon[index]),
                                      name: homeController.basicTitle[index]),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            AppString.interests,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: List.generate(
                              homeController.basicTitle.length,
                              (index) => CustomContainer.customContainer
                                  .commonContainer(
                                      customIcon:
                                          Icon(homeController.basicIcon[index]),
                                      name: homeController.basicTitle[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.amber,
                          child: Image.asset(
                            AppString.foreGroundImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 430, left: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffF7D060)),
                            child: const Icon(
                              Icons.chat,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.amber,
                          child: Image.asset(
                            AppString.backGroundImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 430, left: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffF7D060)),
                            child: const Icon(
                              Icons.chat,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 500,
                      decoration: BoxDecoration(color: Colors.yellow.shade50),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(AppString.location)
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              AppString.city,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              AppString.country,
                              style: TextStyle(fontSize: 18),
                            ),
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffF7D060)),
                                child: const Icon(
                                  Icons.star,
                                  size: 40,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xffF7D060)),
                                  child: const Icon(
                                    Icons.close,
                                    size: 40,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xffF7D060)),
                                  child: const Icon(
                                    Icons.done,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Center(
                                child: Text(
                              AppString.report,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
