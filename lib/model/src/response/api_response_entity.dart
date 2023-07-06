import 'package:web_flutter/generated/json/base/json_field.dart';
import 'package:web_flutter/generated/json/api_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ApiResponseEntity {
	late bool status;
	late String message;
	late List<ApiResponseData> data;

	ApiResponseEntity();

	factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ApiResponseData {
	late String id;
	@JSONField(name: "server_id")
	late String serverId;
	late String cookie;
	@JSONField(name: "total_report")
	late String totalReport;
	@JSONField(name: "today_report")
	late String todayReport;
	late String istatus;
	@JSONField(name: "day_max_report")
	late String dayMaxReport;
	@JSONField(name: "update_time")
	late String updateTime;

	ApiResponseData();

	factory ApiResponseData.fromJson(Map<String, dynamic> json) => $ApiResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $ApiResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}