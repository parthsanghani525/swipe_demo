import 'package:flutter/material.dart';
import 'package:image_swipe_demo/utility/constant/string_constant.dart';
import 'package:image_swipe_demo/utility/widgets/common_bottomBar.dart';

actions(BuildContext context, String name, type) {
  showDialog(
    context: context,
    builder: (context) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop(true);
      });

      return AlertDialog(
        content: buttonWidget(
            type == AppString.like
                ? Icons.favorite
                : type == AppString.reject
                    ? Icons.close
                    : Icons.star,
            type == AppString.like
                ? Colors.pink
                : type == AppString.reject
                    ? Colors.red
                    : Colors.blue),
        title: Text(
          'You $type $name',
          style: TextStyle(
              color: type == AppString.like
                  ? Colors.pink
                  : type == AppString.reject
                      ? Colors.red
                      : Colors.blue),
        ),
      );
    },
  );
}
