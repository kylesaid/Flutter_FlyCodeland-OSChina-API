import 'dart:convert';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  // 配置 Dio 实例
  static final BaseOptions _options = BaseOptions(
    baseUrl: "https://www.oschina.net/",
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  );

  // 创建 Dio 实例
  static final Dio _dio = Dio(_options);

  // _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path,
      {String method = 'GET', Map? params,data}) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.contains(key)) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    LogUtil.v(data, tag: 'send data is:');

    try {
      Response response = await _dio.request(
          path, data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data['code'] != 1) {
            LogUtil.v(
                response.data['code'], tag: 'server error, status code is:');
            EasyLoading.showInfo(
                "服务器错误，状态码为：${response.data['code']}");
            return Future.error(response.data['message']);
          } else {
            LogUtil.v(response.data, tag: 'response data:');
            if (response.data is Map) {
              return response.data;
            } else {
              return json.decode(response.data.toString());
            }
          }
        } catch (e) {
          LogUtil.v(e, tag: 'decode response data error');
          return Future.error('decode response data error');
        }
      } else {
        LogUtil.v(response.statusCode, tag: 'HTTP error, status code:');
        EasyLoading.showInfo('HTTP错误，状态码为：${response.statusCode!}');
        _handleHttpError(response.statusCode!);
        return Future.error('HTTP Error');
      }
    } on DioException catch (e, s) {

      LogUtil.v(_dioError(e), tag: 'request error');
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));

    } catch (e, s) {
      LogUtil.v(e, tag: 'unknown error');
      return Future.error('unknown error');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "网络连接超时，请检查网络设置";
        //不会执行，可以移除的代码,实际需要加break;
        // Dead code. (Documentation)
        // Try removing the code, or fixing the code before it so that it can be reached.
        break;
      case DioExceptionType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioExceptionType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioExceptionType.badResponse:
        return "服务器异常，请稍后重试！";
      case DioExceptionType.cancel:
        return "请求已被取消，请重新请求";
      case DioExceptionType.unknown:
        return "网络异常，请稍后重试！";
      default:
        return "Dio异常";
    }
  }

  // 处理 Http 错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future<T> get<T>(String path,{Map? params}) {
    return _request(path,params: params);
  }

  static Future<T> post<T>(String path, { Map? params,data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
}