import 'package:web_flutter/generated/json/base/json_field.dart';
import 'package:web_flutter/generated/json/api_responses_entity.g.dart';
import 'dart:convert';

class ApiResponsesEntity {
  late bool status;
  late String message;
  late List<dynamic> data;

  ApiResponsesEntity();

  factory ApiResponsesEntity.fromJson(Map<String, dynamic> json) =>
      $ApiResponsesEntityFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponsesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
