// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

// import 'dart:convert';
//
// DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));
//
// String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.numberOfBookings,
    this.upcomingCount,
    this.totalEarnings,
    this.userId,
  });

  int numberOfBookings;
  int upcomingCount;
  String totalEarnings;
  String userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    numberOfBookings: json["number_of_bookings"],
    upcomingCount: json["upcoming_count"],
    totalEarnings: json["total_earnings"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "number_of_bookings": numberOfBookings,
    "upcoming_count": upcomingCount,
    "total_earnings": totalEarnings,
    "user_id": userId,
  };
}
