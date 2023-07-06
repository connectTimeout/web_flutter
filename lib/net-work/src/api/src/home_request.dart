import 'package:web_flutter/model/model.dart';
import 'package:web_flutter/net-work/src/api/api.dart';
import 'package:web_flutter/net-work/src/net-util/request_client.dart';

class HomeRequest {
  static Future<List<UserModelEntity>?> getUser({
    int status = 0,
  }) async {
    try {
      var params = {
        "status": status,
      };
      var json = await requestClient.get(APIS.user, queryParameters: params)
          as List<dynamic>;
      return json.map((e) => UserModelEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<AccountModelEntity>?> getAccount({
    int status = 0,
  }) async {
    try {
      var params = {
        "status": status,
      };
      var json = await requestClient.get(APIS.account, queryParameters: params)
          as List<dynamic>;
      return json.map((e) => AccountModelEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postBatchTask({
    BatchTaskModelEntity? params,
  }) async {
    try {
      var json = await requestClient.post(APIS.batchTask, data: params);
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postAccount({
    AccountModelEntity? params,
  }) async {
    try {
      var json = await requestClient.post(APIS.batchAccount, data: params);
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
      var params = {
        "table": table,
        "id": id,
      };
      var json = await requestClient.post(APIS.delete, data: params);
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postReason({
    required String reason,
  }) async {
    try {
      var params = {
        "reason": reason,
      };
      var json = await requestClient.post(APIS.reason, data: params);
      return json;
    } catch (e) {
      rethrow;
    }
  }
}
