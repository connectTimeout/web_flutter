import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';

List<Tab> get homeList {
  return [
    tabs(title: "网站统计"),
    tabs(title: "网站收录"),
    tabs(title: "蜘蛛统计"),
    tabs(title: "功能大全"),
    tabs(title: "克隆配置"),
  ];
}
