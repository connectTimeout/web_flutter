import 'package:dio/dio.dart';
import 'package:web_flutter/config/config.dart';
import 'package:web_flutter/model/model.dart';
import 'package:web_flutter/model/src/response/api_response_entity.dart';
import 'package:web_flutter/model/src/server_model_entity.dart';
import 'package:web_flutter/net-work/src/api/api.dart';

class HomeRequest {
  static Future<List<ServerModelEntity>?> getAccount({
    int status = 0,
  }) async {
    try {
      var params = {
        "status": status,
      };

      var response = await Dio()
          .get(
            "${RequestConfig.url}${APIS.server}",
            queryParameters: params,
          )
          .timeout(
            const Duration(seconds: 3),
          );
      ApiResponseEntity<dynamic> apiResponse =
          ApiResponseEntity<dynamic>.fromJson(response.data);
      var json = apiResponse.data as List<dynamic>;
      return json.map((e) => ServerModelEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postBatchTask({
    BatchTaskModelEntity? param,
  }) async {
    try {
      FormData params = FormData.fromMap({
        "domains": param?.domains,
        "report_num": param?.reportNum,
        "report_reason": param?.reportReason,
        "report_type": param?.reportType,
      });
      var json = await Dio()
          .post(
            "${RequestConfig.url}${APIS.batchTask}",
            data: params,
          )
          .timeout(
            const Duration(seconds: 3),
          );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postAddServer({
    String? iname,
    String? location,
    String? isp,
  }) async {
    try {
      FormData params = FormData.fromMap({
        "iname": iname,
        "location": location,
        "isp": isp,
      });
      var json = await Dio()
          .post(
            "${RequestConfig.url}${APIS.addServer}",
            data: params,
          )
          .timeout(
            const Duration(seconds: 3),
          );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postAccount({
    AccountModelEntity? param,
  }) async {
    try {
      FormData params = FormData.fromMap({
        "cookies": param?.cookie,
        "day_max_report": param?.dayMaxReport,
        "server_id": param?.serverId,
      });
      var json = await Dio()
          .post(
            "${RequestConfig.url}${APIS.batchAccount}",
            data: params,
          )
          .timeout(
            const Duration(seconds: 3),
          );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postDelete({
    required String table,
    required String id,
  }) async {
    try {
      FormData params = FormData.fromMap({
        "table": table,
        "id": id,
      });
      var json = await Dio()
          .post(
            "${RequestConfig.url}${APIS.delete}",
            data: params,
          )
          .timeout(
            const Duration(seconds: 3),
          );
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postReason({
    required String reason,
  }) async {
    try {
      FormData params = FormData.fromMap({
        "reason": reason,
      });
      var json = await Dio()
          .post(
            "${RequestConfig.url}${APIS.reason}",
            data: params,
          )
          .timeout(
            const Duration(seconds: 3),
          );
      return json;
    } catch (e) {
      rethrow;
    }
  }
}
