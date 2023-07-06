import 'package:web_flutter/generated/json/base/json_convert_content.dart';
import 'package:web_flutter/model/src/response/api_response_entity.dart';

ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
  final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity();
  final bool? status = jsonConvert.convert<bool>(json['status']);
  if (status != null) {
    apiResponseEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    apiResponseEntity.message = message;
  }
  final T? data = jsonConvert.convert<T>(json['data']);
  if (data != null) {
    apiResponseEntity.data = data;
  }
  return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data;
  return data;
}
