import 'package:web_flutter/generated/json/base/json_field.dart';
import 'package:web_flutter/generated/json/batch_task_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BatchTaskModelEntity {
	late String domains;
	@JSONField(name: "report_num")
	late String reportNum;
	@JSONField(name: "report_type")
	late String reportType;
	@JSONField(name: "report_reason")
	late String reportReason;

	BatchTaskModelEntity();

	factory BatchTaskModelEntity.fromJson(Map<String, dynamic> json) => $BatchTaskModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $BatchTaskModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}