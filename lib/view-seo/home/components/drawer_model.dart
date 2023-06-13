import 'package:flutter/material.dart';
import 'package:web_flutter/consts/consts.dart';

class DrawerModel {
  DrawerModel({
    this.image,
    required this.type,
    required this.value,
    this.message,
  });
  final String? image;
  final String value;
  final NavigationDrawerType type;
  final String? message;
}

class TextButtonModel {
  const TextButtonModel(this.value, {required this.onPressed});
  final String value;
  final VoidCallback onPressed;
}
