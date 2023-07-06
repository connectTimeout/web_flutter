import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_flutter/config/config.dart';
import 'package:web_flutter/model/model.dart';
import 'package:web_flutter/model/src/response/api_response_entity.dart';

import 'exception.dart';

RequestClient requestClient = RequestClient();

class RequestClient {
  late Dio _dio;

  RequestClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: RequestConfig.url,
        connectTimeout:
            const Duration(milliseconds: RequestConfig.connectTimeout),
      ),
    );
  }
  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  Future<T?> request<T>(
    String url, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool Function(ApiException)? onError,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;
      data = _convertRequestData(data);
      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);

      return _handleResponse<T>(response);
    } catch (e) {
      var exception = ApiException.from(e);
      if (onError?.call(exception) != true) {
        throw exception;
      }
    }
    return null;
  }

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        queryParameters: queryParameters, headers: headers, onError: onError);
  }

  Future<T?> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(
      url,
      method: "POST",
      queryParameters: queryParameters,
      data: data,
      headers: headers,
      onError: onError,
    );
  }

  Future<T?> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "DELETE",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future<T?> put<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "PUT",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  ///请求响应内容处理
  T? _handleResponse<T>(Response response) {
    if (response.data["status"] == true) {
      if (T.toString() == (RawData).toString()) {
        RawData raw = RawData();
        raw.value = response.data;
        return raw as T?;
      } else {
        ApiResponseEntity<T> apiResponse =
            ApiResponseEntity<T>.fromJson(response.data);
        return _handleBusinessResponse<T>(apiResponse);
      }
    } else {
      var exception = ApiException(
        response.data["status"],
        response.data["message"],
      );
      throw exception;
    }
  }

  ///业务内容处理
  T? _handleBusinessResponse<T>(ApiResponseEntity<T> response) {
    if (response.status == RequestConfig.requestSuccessful) {
      return response.data;
    } else {
      int? code;
      if (response.status == false) {
        code = -1;
      } else {
        code = 0;
      }
      var exception = ApiException(code, response.message);
      throw exception;
    }
  }
}
