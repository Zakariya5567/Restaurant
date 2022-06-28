// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
    OrderDetailModel({
        this.data,
        this.result,
    });

    Data data;
    Result result;

    factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "result": result == null ? null : result.toJson(),
    };
}

class Data {
    Data({
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
        this.statusName,
        this.products,
        this.orderSubTotal,
        this.restaurantImage,
        this.restaurantName,
    });

    int id;
    DateTime orderDate;
    String time;
    int status;
    int orderTotal;
    String fee;
    String paymentMethod;
    DateTime createdAt;
    DateTime updatedAt;
    int companyId;
    dynamic deviceType;
    String discount;
    int customerId;
    String tax;
    dynamic promoCode;
    String fromAddress;
    String deliveryAddress;
    String statusName;
    List<Product> products;
    int orderSubTotal;
    String restaurantImage;
    String restaurantName;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        time: json["time"] == null ? null : json["time"],
        status: json["status"] == null ? null : json["status"],
        orderTotal: json["order_total"] == null ? null : json["order_total"],
        fee: json["fee"] == null ? null : json["fee"],
        paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        companyId: json["company_id"] == null ? null : json["company_id"],
        deviceType: json["device_type"],
        discount: json["discount"] == null ? null : json["discount"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        tax: json["tax"] == null ? null : json["tax"],
        promoCode: json["promo_code"],
        fromAddress: json["from_address"] == null ? null : json["from_address"],
        deliveryAddress: json["delivery_address"] == null ? null : json["delivery_address"],
        statusName: json["status_name"] == null ? null : json["status_name"],
        products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        orderSubTotal: json["order_sub_total"] == null ? null : json["order_sub_total"],
       restaurantImage: json["restaurant_image"] == null ? null : json["restaurant_image"],
        restaurantName: json["restaurant_name"] == null ? null : json["restaurant_name"],
                            
                     

                            
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_date": orderDate == null ? null : "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "time": time == null ? null : time,
        "status": status == null ? null : status,
        "order_total": orderTotal == null ? null : orderTotal,
        "fee": fee == null ? null : fee,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "company_id": companyId == null ? null : companyId,
        "device_type": deviceType,
        "discount": discount == null ? null : discount,
        "customer_id": customerId == null ? null : customerId,
        "tax": tax == null ? null : tax,
        "promo_code": promoCode,
        "from_address": fromAddress == null ? null : fromAddress,
        "delivery_address": deliveryAddress == null ? null : deliveryAddress,
        "status_name": statusName == null ? null : statusName,
        "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
        "order_sub_total": orderSubTotal == null ? null : orderSubTotal,
        "restaurant_image":restaurantImage==null?null:restaurantImage,
        "restaurant_name":restaurantName==null?null:restaurantImage,
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
        productName: json["product_name"] == null ? null : json["product_name"],
        productId: json["product_id"] == null ? null : json["product_id"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        description: json["description"],
        productPrice: json["product_price"] == null ? null : json["product_price"],
        discountedPrice: json["discounted_price"] == null ? null : json["discounted_price"],
    );

    Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "product_id": productId == null ? null : productId,
        "quantity": quantity == null ? null : quantity,
        "description": description,
        "product_price": productPrice == null ? null : productPrice,
        "discounted_price": discountedPrice == null ? null : discountedPrice,
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
        code: json["Code"] == null ? null : json["Code"],
        message: json["Message"] == null ? null : json["Message"],
        description: json["Description"] == null ? null : json["Description"],
        rflag: json["Rflag"] == null ? null : json["Rflag"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Message": message == null ? null : message,
        "Description": description == null ? null : description,
        "Rflag": rflag == null ? null : rflag,
    };
}
