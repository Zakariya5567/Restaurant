// To parse this JSON data, do
//
//     final updateProductModel = updateProductModelFromJson(jsonString);

import 'dart:convert';

UpdateProductModel updateProductModelFromJson(String str) => UpdateProductModel.fromJson(json.decode(str));

String updateProductModelToJson(UpdateProductModel data) => json.encode(data.toJson());

class UpdateProductModel {
    UpdateProductModel({
        this.data,
        this.result,
    });

    Data data;
    Result result;

    factory UpdateProductModel.fromJson(Map<String, dynamic> json) => UpdateProductModel(
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
        this.id,
        this.name,
        this.shortDesc,
        this.longDesc,
        this.originalPrice,
        this.salePrice,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String shortDesc;
    String longDesc;
    String originalPrice;
    dynamic salePrice;
    String image;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        shortDesc: json["short_desc"],
        longDesc: json["long_desc"],
        originalPrice: json["original_price"],
        salePrice: json["sale_price"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_desc": shortDesc,
        "long_desc": longDesc,
        "original_price": originalPrice,
        "sale_price": salePrice,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
