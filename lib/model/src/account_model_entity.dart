import 'package:web_flutter/generated/json/base/json_field.dart';
import 'package:web_flutter/generated/json/account_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AccountModelEntity {
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

	AccountModelEntity();

	factory AccountModelEntity.fromJson(Map<String, dynamic> json) => $AccountModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $AccountModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}