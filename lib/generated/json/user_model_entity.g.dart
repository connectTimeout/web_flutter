import 'package:web_flutter/generated/json/base/json_convert_content.dart';
import 'package:web_flutter/model/src/user_model_entity.dart';

UserModelEntity $UserModelEntityFromJson(Map<String, dynamic> json) {
	final UserModelEntity userModelEntity = UserModelEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userModelEntity.id = id;
	}
	final String? domain = jsonConvert.convert<String>(json['domain']);
	if (domain != null) {
		userModelEntity.domain = domain;
	}
	final String? bdIndex = jsonConvert.convert<String>(json['bd_index']);
	if (bdIndex != null) {
		userModelEntity.bdIndex = bdIndex;
	}
	final String? reportNum = jsonConvert.convert<String>(json['report_num']);
	if (reportNum != null) {
		userModelEntity.reportNum = reportNum;
	}
	final String? totalReport = jsonConvert.convert<String>(json['total_report']);
	if (totalReport != null) {
		userModelEntity.totalReport = totalReport;
	}
	final String? reportType = jsonConvert.convert<String>(json['report_type']);
	if (reportType != null) {
		userModelEntity.reportType = reportType;
	}
	final String? reportReason = jsonConvert.convert<String>(json['report_reason']);
	if (reportReason != null) {
		userModelEntity.reportReason = reportReason;
	}
	final String? istatus = jsonConvert.convert<String>(json['istatus']);
	if (istatus != null) {
		userModelEntity.istatus = istatus;
	}
	final String? createTime = jsonConvert.convert<String>(json['create_time']);
	if (createTime != null) {
		userModelEntity.createTime = createTime;
	}
	final String? updateTime = jsonConvert.convert<String>(json['update_time']);
	if (updateTime != null) {
		userModelEntity.updateTime = updateTime;
	}
	return userModelEntity;
}

Map<String, dynamic> $UserModelEntityToJson(UserModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['domain'] = entity.domain;
	data['bd_index'] = entity.bdIndex;
	data['report_num'] = entity.reportNum;
	data['total_report'] = entity.totalReport;
	data['report_type'] = entity.reportType;
	data['report_reason'] = entity.reportReason;
	data['istatus'] = entity.istatus;
	data['create_time'] = entity.createTime;
	data['update_time'] = entity.updateTime;
	return data;
}