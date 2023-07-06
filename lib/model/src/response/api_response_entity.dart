import 'package:web_flutter/model/src/response/api_response_entity.g.dart';
import 'dart:convert';

class ApiResponseEntity<T> {
  late bool status;
  late String message;
  late T data;

  ApiResponseEntity();

  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ApiResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
