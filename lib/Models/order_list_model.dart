// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
    OrderListModel({
        this.data,
        this.result,
    });

    List<Datum> data;
    Result result;

    factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
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
        this.orderDate,
        this.time,
        this.status,
        this.orderTotal,
        this.fee,
        this.paymentMethod,
        this.createdAt,
        this.updatedAt,
        this.companyId,
        this.deviceType,
        this.discount,
        this.customerId,
        this.tax,
        this.promoCode,
        this.fromAddress,
        this.deliveryAddress,
        this.products, 
        this.statusName,
    });

    int id;
    DateTime orderDate;
    String time;
    int status;
    String orderTotal;
    String fee;
    String paymentMethod;
    DateTime createdAt;
    DateTime updatedAt;
    int companyId;
    dynamic deviceType;
    dynamic discount;
    int customerId;
    dynamic tax;
    dynamic promoCode;
    String fromAddress;
    String deliveryAddress;
    String statusName;
    List<Product> products;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderDate:
         json["order_date"] == null ? null :
          DateTime.parse(json["order_date"]),
        time:  json["time"],
        status: json["status"],
        orderTotal: json["order_total"],
        fee: json["fee"],
        paymentMethod: json["payment_method"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        companyId: json["company_id"],
        deviceType: json["device_type"],
        discount: json["discount"],
        customerId: json["customer_id"],
        tax: json["tax"],
        promoCode: json["promo_code"],
        fromAddress: json["from_address"],
        deliveryAddress: json["delivery_address"],
        statusName:json["status_name"],
        
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
         "order_date": 
         //orderDate == null ? null : 
        "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "time":  time,
        "status": status,
        "order_total": orderTotal,
        "fee": fee,
        "payment_method": paymentMethod,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "company_id": companyId,
        "device_type": deviceType,
        "discount": discount,
        "customer_id": customerId,
        "tax": tax,
        "promo_code": promoCode,
        "from_address": fromAddress,
        "delivery_address": deliveryAddress,
        "status_name": statusName,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.productName,
        this.productId,
        this.quantity,
        this.description,
        this.productPrice,
        this.discountedPrice,
    });

    String productName;
    int productId;
    int quantity;
    dynamic description;
    int productPrice;
    String discountedPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"],
        productId: json["product_id"],
        quantity: json["quantity"],
        description: json["description"],
        productPrice: json["product_price"],
        discountedPrice: json["discounted_price"],
    );

    Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_id": productId,
        "quantity": quantity,
        "description": description,
        "product_price": productPrice,
        "discounted_price": discountedPrice,
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
