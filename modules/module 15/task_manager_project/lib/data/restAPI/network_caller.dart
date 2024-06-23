import 'dart:convert';

import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller{
  Future<NetworkResponse> getRequest(String url) async{
    try{
      Response response=await get(Uri.parse(url)) ;
      if(response.statusCode==200){
        final decodedData=jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );

      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    }catch(e){
      return NetworkResponse(
          statusCode: -1,
          isSuccess: false,
          errorMsg: e.toString(),
      );
    }

  }

}