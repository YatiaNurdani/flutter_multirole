import 'dart:io';
import 'package:multirole/Helper/user_info.dart';
import 'package:multirole/Helper/app_exception.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post(dynamic url, dynamic data) async {
  var token = await UserInfo().getToken();
  var responseJson;
  try {
    final response = await http.post(Uri.parse(url),
      body: data,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    responseJson = _returnResponse(response); 
  } on SocketException {
      throw FetchDataException('No Internet connection');
  }
 return responseJson;

}

Future<dynamic> get(dynamic url) async {
  var token = await UserInfo().getToken();
  var responseJson;
  try {
    final response = await http.get(Uri.parse(url),
     headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    responseJson = _returnResponse(response);
  } on SocketException {
      throw FetchDataException('No Internet connection');
  }
  return responseJson;
}

Future<dynamic> delete(dynamic url) async {
  var token = await UserInfo().getToken();
  var responseJson;
  try {
    final response = await http.delete(Uri.parse(url),
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    responseJson = _returnResponse(response);
  } on SocketException {
    throw FetchDataException('No Internet connection');
  }
  return responseJson;
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 422:
      throw InvalidInputException(response.body.toString());
    case 500:
    default:
    throw FetchDataException('Error While Communication with Server with Status Code occured ${response.statusCode}');

  }
 }
}