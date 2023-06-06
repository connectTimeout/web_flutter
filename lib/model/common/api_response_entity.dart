import 'dart:convert';

import 'api_response_entity.g.dart';
class ApiResponseEntity<T> {
	late int code;
	late String msg;
	late T data;

	ApiResponseEntity();

	factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson<T>(json);

	Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}