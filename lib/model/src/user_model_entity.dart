import 'package:web_flutter/generated/json/base/json_field.dart';
import 'package:web_flutter/generated/json/user_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserModelEntity {
  late String id;
  late String? domain;
  @JSONField(name: "bd_index")
  late String? bdIndex;
  @JSONField(name: "report_num")
  late String? reportNum;
  @JSONField(name: "total_report")
  late String? totalReport;
  @JSONField(name: "report_type")
  late String? reportType;
  @JSONField(name: "report_reason")
  late String? reportReason;
  late String? istatus;
  @JSONField(name: "create_time")
  late String? createTime;
  @JSONField(name: "update_time")
  late String? updateTime;

  UserModelEntity();

  factory UserModelEntity.fromJson(Map<String, dynamic> json) =>
      $UserModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
