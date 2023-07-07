import 'package:web_flutter/generated/json/base/json_field.dart';
import 'package:web_flutter/generated/json/server_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ServerModelEntity {
	late String id;
	late String iname;
	late String location;
	late String isp;
	late String message;
	@JSONField(name: "create_time")
	late String createTime;

	ServerModelEntity();

	factory ServerModelEntity.fromJson(Map<String, dynamic> json) => $ServerModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $ServerModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}