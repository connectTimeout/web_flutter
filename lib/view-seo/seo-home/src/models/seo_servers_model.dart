import 'package:flutter/material.dart';
import 'package:web_flutter/consts/consts.dart';

class ServersModel {
  final String serverName;
  final int id;
  ServersModel(
    this.serverName,
    this.id,
  );
}

class DomainMapModel {
  final int id;
  final List<DomainNameModel> list;
  DomainMapModel(this.id, this.list);
}

class DomainNameModel {
  final String name;
  final NavigationDrawerType type;
  final String? message;
  DomainNameModel(this.name, this.type, this.message);
}

class SEOTabBarModel {
  final String? title;
  final String? namePath;
  final Map<String, dynamic>? queryParameters;
  SEOTabBarModel(this.namePath, {this.title, this.queryParameters});
}

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
