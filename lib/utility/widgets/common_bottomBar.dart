import 'package:flutter/material.dart';

class CommonBottomBar extends StatefulWidget {
  const CommonBottomBar({Key? key}) : super(key: key);

  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonWidget(Icons.person, Colors.grey),
          buttonWidget(Icons.menu, Colors.black),
          buttonWidget(Icons.favorite, Colors.grey),
          buttonWidget(Icons.chat, Colors.grey),
        ],
      ),
    );
  }
}

Widget buttonWidget(IconData icon, Color color) {
  return SizedBox(
    height: 60,
    width: 60,
    child: Icon(
      icon,
      color: color,
      size: 30,
    ),
  );
}