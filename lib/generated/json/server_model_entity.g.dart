import 'package:web_flutter/generated/json/base/json_convert_content.dart';
import 'package:web_flutter/model/src/server_model_entity.dart';

ServerModelEntity $ServerModelEntityFromJson(Map<String, dynamic> json) {
	final ServerModelEntity serverModelEntity = ServerModelEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		serverModelEntity.id = id;
	}
	final String? iname = jsonConvert.convert<String>(json['iname']);
	if (iname != null) {
		serverModelEntity.iname = iname;
	}
	final String? location = jsonConvert.convert<String>(json['location']);
	if (location != null) {
		serverModelEntity.location = location;
	}
	final String? isp = jsonConvert.convert<String>(json['isp']);
	if (isp != null) {
		serverModelEntity.isp = isp;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		serverModelEntity.message = message;
	}
	final String? createTime = jsonConvert.convert<String>(json['create_time']);
	if (createTime != null) {
		serverModelEntity.createTime = createTime;
	}
	return serverModelEntity;
}

Map<String, dynamic> $ServerModelEntityToJson(ServerModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['iname'] = entity.iname;
	data['location'] = entity.location;
	data['isp'] = entity.isp;
	data['message'] = entity.message;
	data['create_time'] = entity.createTime;
	return data;
}