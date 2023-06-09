import 'package:flutter/material.dart';

Tab tabs({
  String? title,
}) {
  return Tab(
    height: 34,
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey,
                Colors.white60,
                Colors.white,
                Colors.transparent,
              ],
              stops: [
                0.3,
                0.6,
                0.3,
                0,
              ]),
        ),
        child: Text(title ?? '')),
  );
}
