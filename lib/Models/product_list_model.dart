// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
    ProductListModel({
        this.data,
        this.result,
    });

    List<Datum> data;
    Result result;

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
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
        this.name,
        this.shortDesc,
        this.longDesc,
        this.originalPrice,
        this.salePrice,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.catName,
        this.imagePath,
    });

    int id;
    String name;
    String shortDesc;
    dynamic longDesc;
    int originalPrice;
    dynamic salePrice;
    dynamic image;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    String catName;
    String imagePath;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        catName: json["cat_name"],
        imagePath: json["image_path"],
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
        "cat_name": catName,
        "image_path": imagePath,
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
