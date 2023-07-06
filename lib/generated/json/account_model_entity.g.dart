import 'package:web_flutter/generated/json/base/json_convert_content.dart';
import 'package:web_flutter/model/src/account_model_entity.dart';

AccountModelEntity $AccountModelEntityFromJson(Map<String, dynamic> json) {
	final AccountModelEntity accountModelEntity = AccountModelEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		accountModelEntity.id = id;
	}
	final String? serverId = jsonConvert.convert<String>(json['server_id']);
	if (serverId != null) {
		accountModelEntity.serverId = serverId;
	}
	final String? cookie = jsonConvert.convert<String>(json['cookie']);
	if (cookie != null) {
		accountModelEntity.cookie = cookie;
	}
	final String? totalReport = jsonConvert.convert<String>(json['total_report']);
	if (totalReport != null) {
		accountModelEntity.totalReport = totalReport;
	}
	final String? todayReport = jsonConvert.convert<String>(json['today_report']);
	if (todayReport != null) {
		accountModelEntity.todayReport = todayReport;
	}
	final String? istatus = jsonConvert.convert<String>(json['istatus']);
	if (istatus != null) {
		accountModelEntity.istatus = istatus;
	}
	final String? dayMaxReport = jsonConvert.convert<String>(json['day_max_report']);
	if (dayMaxReport != null) {
		accountModelEntity.dayMaxReport = dayMaxReport;
	}
	final String? updateTime = jsonConvert.convert<String>(json['update_time']);
	if (updateTime != null) {
		accountModelEntity.updateTime = updateTime;
	}
	return accountModelEntity;
}

Map<String, dynamic> $AccountModelEntityToJson(AccountModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['server_id'] = entity.serverId;
	data['cookie'] = entity.cookie;
	data['total_report'] = entity.totalReport;
	data['today_report'] = entity.todayReport;
	data['istatus'] = entity.istatus;
	data['day_max_report'] = entity.dayMaxReport;
	data['update_time'] = entity.updateTime;
	return data;
}