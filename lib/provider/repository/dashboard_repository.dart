import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lilac_doctorapp/data/dio_client.dart';
import 'package:lilac_doctorapp/model/api_response.dart';
import 'package:lilac_doctorapp/utils/app_constants.dart';
import 'package:lilac_doctorapp/utils/urls_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../encryption_decryption.dart';

class DashboardRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  DashboardRepo(this.dioClient, this.sharedPreferences);
  
  Future<ApiResponse> dashboardApi(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(TOKEN);
    // var datatoken = decryptAESCryptoJS(data, TOKEN);
    try{
      final response= await dioClient.post(UrlsClass.dashBoardUrl,
          options: Options(
            
          )
          // queryParameters: {"Accept": "application/json", "token": datatoken}
      );
    return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(e);
    }
  }
}