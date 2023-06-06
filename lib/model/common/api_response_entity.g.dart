
import 'package:web_flutter/generated/generated.dart';

import 'api_response_entity.dart';


ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
	final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity<T>();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		apiResponseEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		apiResponseEntity.msg = message;
	}
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		apiResponseEntity.data = data;
	}
	return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.msg;
	data['data'] = entity.data;
	return data;
}