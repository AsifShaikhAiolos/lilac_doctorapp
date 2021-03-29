import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lilac_doctorapp/model/api_response.dart';
import 'package:lilac_doctorapp/model/dashborad_model.dart';
import 'package:lilac_doctorapp/provider/repository/dashboard_repository.dart';

class DashboardProvider with ChangeNotifier {
  final DashboardRepo dashboardRepo;

  List<Data> _dashboardlist = [];

  DashboardProvider(this.dashboardRepo);

  List<Data> get getDashBorad => _dashboardlist;


  Future<void> getDashboardApi(String token) async{
    // Data _responseModel;
    ApiResponse apiResponse=await dashboardRepo.dashboardApi(token);
    if(apiResponse.response !=null && apiResponse.response.statusCode == 200){
    // return  List<Map<String, dynamic>>.from(json.decode(apiResponse.response.data)['number_of_bookings']);
    //   _dashboardlist = [];
    //   apiResponse.response.data.forEach((category) => _dashboardlist.add(Data.fromJson(category)));
    //   notifyListeners();
     return apiResponse.response.data["number_of_bookings"] ;
      // return _responseModel;
    }
  }


}
