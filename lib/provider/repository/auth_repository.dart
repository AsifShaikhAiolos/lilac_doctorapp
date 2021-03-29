import 'package:lilac_doctorapp/data/dio_client.dart';
import 'package:lilac_doctorapp/model/api_response.dart';
import 'package:lilac_doctorapp/utils/app_constants.dart';
import 'package:lilac_doctorapp/utils/urls_class.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../encryption_decryption.dart';
class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo(this.dioClient, this.sharedPreferences);
  Response response;
  Future<ApiResponse> login({String email, String password}) async {
    try {
      // var client=http.Client();
      // var url = Uri.http(UrlsClass.Base_URl, UrlsClass.loginUrl);
       response = await dioClient.post(
        UrlsClass.loginUrl, data: {"email": email, "password": password},

      );
      // Map<String, dynamic> respMap;
      // var isTokenSuccess = response.data;
      // if (isTokenSuccess) {
      //   respMap = json.decode(response.data);
      //   String token = respMap['data'];
      //   // print("got token: -> $token");
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   var encrypted = encryptAESCryptoJS(token, TOKEN);
      //   prefs.setString(TOKEN, encrypted);
      //   // return respMap;
      // } else {
      //   print("API Error:- ");
      //   return null;
      // }
      return ApiResponse.withSuccess(response);
    } catch(e){
      print(e.toString());
      return ApiResponse.withError(e);
    }
  }
// for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
    try {
      await sharedPreferences.setString(UrlsClass.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }
  Future<String> _saveDeviceToken() async {
    Map<String, dynamic> respMap;
    respMap = json.decode(response.data);
    String token = respMap['data'];
    String _deviceToken = token;
    if (_deviceToken != null) {
      print('--------Device Token---------- '+_deviceToken);
    }
    return _deviceToken;
  }

  String getUserToken() {
    return sharedPreferences.getString(UrlsClass.TOKEN) ?? "";
  }

}