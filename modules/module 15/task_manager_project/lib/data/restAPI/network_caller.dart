import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager_project/taskManagerApp.dart';
import 'package:task_manager_project/ui/controller/auth_controller.dart';
import 'package:task_manager_project/ui/screens/auth/SignInScreen.dart';
import '../models/network_response.dart';
import 'package:logger/logger.dart'; // Add Logger package

// Create an instance of Logger for logging requests and responses
var logger = Logger();

/// A utility class for handling network requests (GET and POST).
/// All responses return a [NetworkResponse] object for uniform error handling.
class NetworkCaller {
  /// Handles GET requests.
  /// Accepts the [url] of the endpoint as a parameter and sends an authenticated GET request.
  /// It logs the URL, response status code, and body for debugging purposes.
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      // Log the URL being requested
      logger.i("GET Request URL: $url");

      // Make the GET request with authentication token
      Response response = await get(
        Uri.parse(url),
        headers: {
          'token': AuthController.accessToken,
        },
      );
      logger.d('Access Token: ${AuthController.accessToken}');


      // Log the status code and response body
      logger.d("GET Response Status: ${response.statusCode}");
      logger.d("GET Response Body: ${response.body}");

      // Handle successful response
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      }
      // Handle unauthorized request and redirect to login
      else if (response.statusCode == 401) {
        await redirectToLogIn();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
      // Handle other response status codes
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      // Log the exception error
      logger.e("GET Request Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  /// Handles POST requests.
  /// Accepts the [url] and [body] of the request.
  /// Logs the URL, body, response status code, and response body for debugging.
  static Future<NetworkResponse> postRequest(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    try {
      // Log the URL and request body being posted
      logger.i("POST Request URL: $url");
      logger.d("POST Request Body: ${body.toString()}");

      // Make the POST request with authentication token
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          'token': AuthController.accessToken,
        },
      );

      // Log the status code and response body
      logger.d("POST Response Status: ${response.statusCode}");
      logger.d("POST Response Body: ${response.body}");

      // Handle successful response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      }
      // Handle unauthorized request and redirect to login
      else if (response.statusCode == 401) {
        await redirectToLogIn();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
      // Handle other response status codes
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      // Log the exception error
      logger.e("POST Request Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  /// Redirects the user to the login screen if unauthorized (401 error).
  /// Clears all stored user data and navigates to the sign-in screen.
  static Future<void> redirectToLogIn() async {
    logger.w("Redirecting to Login Screen due to 401 Unauthorized.");
    await AuthController.clearAllData();
    Navigator.pushAndRemoveUntil(
      TaskManagerApp.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
          (route) => false,
    );
  }
}




/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager_project/taskManagerApp.dart';
import 'package:task_manager_project/ui/controller/auth_controller.dart';
import 'package:task_manager_project/ui/screens/auth/SignInScreen.dart';
import '../models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      debugPrint(url);
      Response response = await get(
          Uri.parse(url),
          headers: {
            'token': AuthController.accessToken,
          });
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else if(response.statusCode==401) {
        redirectToLogIn();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body,}) async {
    try {
      debugPrint(url);
      debugPrint(body.toString());
      Response response = await post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'Application/json',
            'token': AuthController.accessToken,
          },);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      }else if(response.statusCode==401) {
        redirectToLogIn();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }  else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMsg: e.toString(),
      );
    }
  }
  static Future<void> redirectToLogIn() async {
    await AuthController.clearAllData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
            (route) => false);
  }
}
*/