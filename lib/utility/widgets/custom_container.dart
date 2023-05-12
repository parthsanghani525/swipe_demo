import 'package:flutter/material.dart';

class CustomContainer {
  CustomContainer._();
  static CustomContainer customContainer = CustomContainer._();
  Widget commonContainer({required String name, required Icon customIcon}) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          customIcon,
          const SizedBox(
            width: 10,
          ),
          Text(name,style: const TextStyle(overflow: TextOverflow.ellipsis),)
        ],
      ),
    );
  }
}
