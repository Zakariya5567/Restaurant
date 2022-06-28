// To parse this JSON data, do
//
//     final earningListModel = earningListModelFromJson(jsonString);

import 'dart:convert';

EarningListModel earningListModelFromJson(String str) => EarningListModel.fromJson(json.decode(str));

String earningListModelToJson(EarningListModel data) => json.encode(data.toJson());

class EarningListModel {
    EarningListModel({
        this.lastMonthEarning,
        this.lastWeekEarning,
        this.todaysEarning,
        this.totalEarning,
        this.result,
    });

    int lastMonthEarning;
    int lastWeekEarning;
    int todaysEarning;
    int totalEarning;
    Result result;

    factory EarningListModel.fromJson(Map<String, dynamic> json) => EarningListModel(
        lastMonthEarning: json["lastMonthEarning"],
        lastWeekEarning: json["lastWeekEarning"],
        todaysEarning: json["todaysEarning"],
        totalEarning: json["TotalEarning"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "lastMonthEarning": lastMonthEarning,
        "lastWeekEarning": lastWeekEarning,
        "todaysEarning": todaysEarning,
        "TotalEarning": totalEarning,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        this.code,
        this.message,
        this.description,
        this.rflag,
    });

    int code;
    String message;
    String description;
    int rflag;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["Code"],
        message: json["Message"],
        description: json["Description"],
        rflag: json["Rflag"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
        "Description": description,
        "Rflag": rflag,
    };
}
