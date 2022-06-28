// To parse this JSON data, do
//
//     final addCategoryModel = addCategoryModelFromJson(jsonString);

import 'dart:convert';

AddCategoryModel addCategoryModelFromJson(String str) => AddCategoryModel.fromJson(json.decode(str));

String addCategoryModelToJson(AddCategoryModel data) => json.encode(data.toJson());

class AddCategoryModel {
    AddCategoryModel({
        this.data,
        this.result,
    });

    Data data;
    Result result;

    factory AddCategoryModel.fromJson(Map<String, dynamic> json) => AddCategoryModel(
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
        this.name,
        this.status,
        this.categoryImage,
        this.coverPhoto,
        this.parentId,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    String name;
    String status;
    String categoryImage;
    String coverPhoto;
    int parentId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        status: json["status"],
        categoryImage: json["category_image"],
        coverPhoto: json["cover_photo"],
        parentId: json["parent_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "category_image": categoryImage,
        "cover_photo": coverPhoto,
        "parent_id": parentId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
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
