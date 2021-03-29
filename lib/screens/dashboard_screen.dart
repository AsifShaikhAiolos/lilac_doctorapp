import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lilac_doctorapp/provider/auth_provider.dart';
import 'package:lilac_doctorapp/provider/dashboard_provider.dart';
import 'package:lilac_doctorapp/utils/app_constants.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool _loading = true;
  var _getNumberOfBooking, _getTotalEarnings, _getUpcomingBooking;

  // Future getDataFromApi() async {
  //   final String url = "http://65.1.45.74:8181/doctor/dashboard";
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final data = prefs.getString(TOKEN);
  //   var datatoken = decryptAESCryptoJS(data, TOKEN);
  //   http.Response response = await http.post(Uri.encodeFull(url),
  //       headers: {"Accept": "application/json", "token": datatoken});
  //
  //   String responseData = response.body;
  //   int finaldata1 = jsonDecode(responseData)["data"]["number_of_bookings"];
  //   int finaldata2 = jsonDecode(responseData)["data"]["upcoming_count"];
  //   var finaldata3 = jsonDecode(responseData)["data"]["total_earnings"];
  //
  //   // print("printing data object: -> $finaldata1");
  //
  //   setState(() {
  //     _getNumberOfBooking = finaldata1;
  //     _getUpcomingBooking = finaldata2;
  //     _getTotalEarnings = finaldata3;
  //   });
  //   return responseData;
  // }
  //
  // @override
  // void initState() {
  //   // getList();
  //   getDataFromApi();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: null,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'DashBoard',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: new Icon(
              Icons.notifications_none,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ),
        body: Consumer<DashboardProvider>(
            builder: (context, dash, child) {
              return
          Center(
            child: Column (
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 120,
                            width: 150,
                            child: buildCard(
                                submit(),
                                "Number of Bookings"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 120,
                            width: 150,
                            child: buildCard("Number of Bookings","Number of Bookings"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
            })
        );
  }

  submit() async{
    Provider.of<DashboardProvider>(context, listen: false).getDashboardApi(
     await Provider.of<AuthProvider>(context, listen: false).getUserToken());
  }

  Card buildCard(String txt1,String txt2) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(txt1,
          // _getNumberOfBooking.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'fontawesome_webfont'),
        ),
        Text(txt2,
          // 'Number of Bookings',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'fontawesome_webfont'),
        ),
      ],
    ));
  }
}
//
// Padding(
// padding: const EdgeInsets.all(16.0),
// child: Row(
// children: [
// Container(
// width: 30,
// height: 30,
// child: SvgPicture.asset(
// "assets/svgs/waving-hand.svg",
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: Text(
// "Hello Asif",
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black,
// fontSize: 18,
// fontWeight: FontWeight.bold,
// fontFamily: 'fontawesome_webfont'),
// ),
// ),
// ],
// ),
// ),