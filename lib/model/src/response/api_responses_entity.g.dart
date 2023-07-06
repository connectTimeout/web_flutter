import 'package:web_flutter/generated/json/base/json_convert_content.dart';
import 'package:web_flutter/model/src/api_responses_entity.dart';

ApiResponsesEntity $ApiResponsesEntityFromJson(Map<String, dynamic> json) {
	final ApiResponsesEntity apiResponsesEntity = ApiResponsesEntity();
	final bool? status = jsonConvert.convert<bool>(json['status']);
	if (status != null) {
		apiResponsesEntity.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		apiResponsesEntity.message = message;
	}
	final List<dynamic>? data = jsonConvert.convertListNotNull<dynamic>(json['data']);
	if (data != null) {
		apiResponsesEntity.data = data;
	}
	return apiResponsesEntity;
}

Map<String, dynamic> $ApiResponsesEntityToJson(ApiResponsesEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] =  entity.data;
	return data;
}