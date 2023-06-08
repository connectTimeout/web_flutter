import 'package:flutter/material.dart';

class HomeModel extends StatelessWidget {
  const HomeModel({super.key, required this.icon, required this.title});

  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15)
          .copyWith(right: 0),
      child: Column(
        children: [
          icon,
          const SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
