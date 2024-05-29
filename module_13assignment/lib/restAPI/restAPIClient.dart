import'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:module_13assignment/style/style.dart';

import '../style/style.dart';

var Postheader={"Content-Type":"application/json"};


Future<List> ProductGridViewListRequest() async {
  var URL=Uri.parse("https://crud.devnextech.com/api/v1/ReadProduct");

  var response= await http.get(URL,headers:Postheader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> ProductCreateRequest(FormValues) async{
  var URL=Uri.parse("https://crud.devnextech.com/api/v1/CreateProduct");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:Postheader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}
Future<bool> ProductDeleteRequest(id) async {
  var deleteUrl=Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var response= await http.get(deleteUrl,headers:Postheader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

   if(ResultCode==200 && ResultBody['status']=="success"){
     SuccessToast("Resuest Success");
     return true;
   } else{
     ErrorToast("Request Fail");
     return false;
   }

}
Future<bool> ProductUpdateRequest(FormValues,id) async{

  var URL=Uri.parse("https://crud.devnextech.com/api/v1/UpdateProduct/"+id);

  var PostBody=json.encode(FormValues);

  var PostHeader={"Content-Type":"application/json"};

  var response= await  http.post(URL,headers:PostHeader,body: PostBody);

  var ResultCode=response.statusCode;

  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}