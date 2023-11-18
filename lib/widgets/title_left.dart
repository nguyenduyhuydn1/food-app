import 'package:flutter/material.dart';
import 'package:food_app_flutter/constant.dart';

class TitleLeft extends StatelessWidget {
  final String title;
  final bool view;
  final bool padding;
  const TitleLeft({
    super.key,
    required this.title,
    this.view = false,
    this.padding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding
          ? const EdgeInsets.symmetric(horizontal: 15)
          : const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (view)
            TextButton(
              onPressed: () {},
              child: const Text(
                "View All",
                style: TextStyle(color: kprimaryColor),
              ),
            )
        ],
      ),
    );
  }
}
