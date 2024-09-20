import 'dart:convert';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
class NetworkCaller {
  final Logger logger;
  NetworkCaller(this.logger);

  Future<NetworkResponse> getRequest({
    required String url,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, {}, '');
      final Response response = await get(
        uri,
        headers: {
          'token': '',
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
            true, url, response.statusCode, response.body, response.headers);
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
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _requestLog(url, {}, body ?? {}, '');
      final Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: {
          'token': '',
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

}
