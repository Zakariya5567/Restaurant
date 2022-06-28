// To parse this JSON data, do
//
//     final updateUserProfileModel = updateUserProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileModel updateUserProfileModelFromJson(String str) => UpdateUserProfileModel.fromJson(json.decode(str));

String updateUserProfileModelToJson(UpdateUserProfileModel data) => json.encode(data.toJson());

class UpdateUserProfileModel {
    UpdateUserProfileModel({
        this.data,
        this.result,
    });

    Data data;
    Result result;

    factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) => UpdateUserProfileModel(
        data: Data.fromJson(json["data"]),
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "result": result.toJson(),
    };
}

class Data {
    Data({
        this.userId,
        this.name,
        this.email,
        this.phoneNo,
        this.timezone,
        this.fcmToken,
        this.profileImage,
        this.latitude,
        this.longitude,
        this.loginType,
        this.alsoRider,
    });

    int userId;
    String name;
    String email;
    String phoneNo;
    String timezone;
    String fcmToken;
    String profileImage;
    double latitude;
    double longitude;
    String loginType;
    int alsoRider;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["UserId"],
        name: json["Name"],
        email: json["Email"],
        phoneNo: json["PhoneNo"],
        timezone: json["Timezone"],
        fcmToken: json["FcmToken"],
        profileImage: json["ProfileImage"],
        latitude: json["Latitude"].toDouble(),
        longitude: json["Longitude"].toDouble(),
        loginType: json["LoginType"],
        alsoRider: json["AlsoRider"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
        "Name": name,
        "Email": email,
        "PhoneNo": phoneNo,
        "Timezone": timezone,
        "FcmToken": fcmToken,
        "ProfileImage": profileImage,
        "Latitude": latitude,
        "Longitude": longitude,
        "LoginType": loginType,
        "AlsoRider": alsoRider,
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
