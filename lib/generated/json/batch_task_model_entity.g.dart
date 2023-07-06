import 'package:web_flutter/generated/json/base/json_convert_content.dart';
import 'package:web_flutter/model/src/batch_task_model_entity.dart';

BatchTaskModelEntity $BatchTaskModelEntityFromJson(Map<String, dynamic> json) {
	final BatchTaskModelEntity batchTaskModelEntity = BatchTaskModelEntity();
	final String? domains = jsonConvert.convert<String>(json['domains']);
	if (domains != null) {
		batchTaskModelEntity.domains = domains;
	}
	final String? reportNum = jsonConvert.convert<String>(json['report_num']);
	if (reportNum != null) {
		batchTaskModelEntity.reportNum = reportNum;
	}
	final String? reportType = jsonConvert.convert<String>(json['report_type']);
	if (reportType != null) {
		batchTaskModelEntity.reportType = reportType;
	}
	final String? reportReason = jsonConvert.convert<String>(json['report_reason']);
	if (reportReason != null) {
		batchTaskModelEntity.reportReason = reportReason;
	}
	return batchTaskModelEntity;
}

Map<String, dynamic> $BatchTaskModelEntityToJson(BatchTaskModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['domains'] = entity.domains;
	data['report_num'] = entity.reportNum;
	data['report_type'] = entity.reportType;
	data['report_reason'] = entity.reportReason;
	return data;
}