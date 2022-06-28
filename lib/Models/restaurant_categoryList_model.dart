// To parse this JSON data, do
//
//     final restaurantCategoryListModel = restaurantCategoryListModelFromJson(jsonString);

import 'dart:convert';

RestaurantCategoryListModel restaurantCategoryListModelFromJson(String str) => RestaurantCategoryListModel.fromJson(json.decode(str));

String restaurantCategoryListModelToJson(RestaurantCategoryListModel data) => json.encode(data.toJson());

class RestaurantCategoryListModel {
    RestaurantCategoryListModel({
        this.data,
        this.result,
    });

    List<Datum> data;
    Result result;

    factory RestaurantCategoryListModel.fromJson(Map<String, dynamic> json) => RestaurantCategoryListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "result": result.toJson(),
    };
}

class Datum {
    Datum({
        this.id,
        this.companyId,
        this.serviceId,
        this.name,
        this.status,
        this.coverPhoto,
        this.categoryImage,
        this.updatedAt,
        this.createdAt,
    });

    int id;
    int companyId;
    int serviceId;
    String name;
    int status;
    String coverPhoto;
    String categoryImage;
    DateTime updatedAt;
    DateTime createdAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        companyId: json["company_id"],
        serviceId: json["service_id"],
        name: json["name"],
        status: json["status"],
        coverPhoto: json["cover_photo"],
        categoryImage: json["category_image"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "service_id": serviceId,
        "name": name,
        "status": status,
        "cover_photo": coverPhoto,
        "category_image": categoryImage,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
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
