import 'dart:convert';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../presentation/controller/auth_controller.dart';
import '../../presentation/ui/screens/email_varification_screen.dart';
import '../models/network_response.dart';
class NetworkCaller {
  final Logger logger;
  final AuthController authController;

  NetworkCaller({required this.logger, required this.authController});

  Future<NetworkResponse> getRequest({
    required String url,
    String? token,
  }) async
  {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, '');
      final Response response = await get(
        uri,
        headers: {
          'token': '${token ?? AuthController.accessToken}',
        },
      );
      if (response.statusCode == 200) {
        _responseLog(
            true, url, response.statusCode, response.body, response.headers);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedBody,
        );
      } else {
        _responseLog(
            false, url, response.statusCode, response.body, response.headers);
        if (response.statusCode == 401) {
          _movedToLogin();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      _responseLog(false, url, -1, {}, {}, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url,required String? token, Map<String, dynamic>? body}) async
  {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, body ?? {}, AuthController.accessToken ?? 'Null');
      //_requestLog(url, {}, body ?? {}, '');
      final Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: {
          'token': token ?? '${AuthController.accessToken}',
          //'Authorization': token ?? '${AuthController.accessToken}',
          'content-type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        _responseLog(
            true, url, response.statusCode, response.body, response.headers);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedBody,
        );
      } else {
        if (response.statusCode == 401) {
          _movedToLogin();
        }
        _responseLog(
            false, url, response.statusCode, response.body, response.headers);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      _responseLog(false, url, -1, {}, {}, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  void _requestLog(String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String token) {
    logger.i('''
    Url : $url
    Params : $params
    Body : $body
    Token : $token
    ''');
  }

  void _responseLog(bool isSuccess, String url, int statusCode,
      dynamic responseBody, Map<String, dynamic> headers,
      [dynamic error]) {
    String message = '''
     Url : $url   
     StatusCode : $statusCode
     Headers : $headers
     ResponseBody : $responseBody   
     Error : $error
    ''';
    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }

  Future<void> _movedToLogin() async {
    await authController.clearUserData();
    getx.Get.to(() => const EmailVarificationScreen());
  }

}
