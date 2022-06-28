// To parse this JSON data, do
//
//     final companyOrdersModel = companyOrdersModelFromJson(jsonString);

import 'dart:convert';

CompanyOrdersModel companyOrdersModelFromJson(String str) => CompanyOrdersModel.fromJson(json.decode(str));

String companyOrdersModelToJson(CompanyOrdersModel data) => json.encode(data.toJson());

class CompanyOrdersModel {
    CompanyOrdersModel({
        this.todaysOrders,
        this.previousOrders,
        this.upcomingOrders,
        this.result,
    });

    List<Order> todaysOrders;
    List<Order> previousOrders;
    List<Order> upcomingOrders;
    Result result;

    factory CompanyOrdersModel.fromJson(Map<String, dynamic> json) => CompanyOrdersModel(
        todaysOrders: List<Order>.from(json["TodaysOrders"].map((x) => Order.fromJson(x))),
        previousOrders: List<Order>.from(json["PreviousOrders"].map((x) => Order.fromJson(x))),
        upcomingOrders: List<Order>.from(json["UpcomingOrders"].map((x) => Order.fromJson(x))),
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "TodaysOrders": List<dynamic>.from(todaysOrders.map((x) => x.toJson())),
        "PreviousOrders": List<dynamic>.from(previousOrders.map((x) => x.toJson())),
        "UpcomingOrders": List<dynamic>.from(upcomingOrders.map((x) => x.toJson())),
        "result": result.toJson(),
    };
}

class Order {
    Order({
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
        this.orderSubTotal,
        this.products,
        this.statusName,
    });

    int id;
    DateTime orderDate;
    String time;
    int status;
    String orderTotal;
    String fee;
    PaymentMethod paymentMethod;
    DateTime createdAt;
    DateTime updatedAt;
    int companyId;
    DeviceType deviceType;
    String discount;
    int customerId;
    String tax;
    dynamic promoCode;
    dynamic fromAddress;
    DeliveryAddress deliveryAddress;
    int orderSubTotal;
    String statusName;
    List<Product> products;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        time: json["time"],
        status: json["status"],
        orderTotal: json["order_total"],
        fee: json["fee"],
        paymentMethod: paymentMethodValues.map[json["payment_method"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        companyId: json["company_id"],
        deviceType: deviceTypeValues.map[json["device_type"]],
        discount: json["discount"],
        customerId: json["customer_id"],
        tax: json["tax"],
        promoCode: json["promo_code"],
        fromAddress: json["from_address"],
        deliveryAddress: deliveryAddressValues.map[json["delivery_address"]],
        orderSubTotal: json["order_sub_total"],
        statusName: json["status_name"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": orderDate == null ? null : "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "order_total": orderTotal,
        "fee": fee,
        "payment_method": paymentMethodValues.reverse[paymentMethod],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "company_id": companyId,
        "device_type": deviceTypeValues.reverse[deviceType],
        "discount": discount,
        "customer_id": customerId,
        "tax": tax,
        "promo_code": promoCode,
        "from_address": fromAddress,
        "delivery_address": deliveryAddressValues.reverse[deliveryAddress],
        "order_sub_total": orderSubTotal,
         "status_name":statusName,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

enum DeliveryAddress { G14_ISLAMABAD_PAKISTAN_40100, G11_ISLAMABAD_PAKISTAN_40100 }

final deliveryAddressValues = EnumValues({
    "G11 Islamabad pakistan 40100": DeliveryAddress.G11_ISLAMABAD_PAKISTAN_40100,
    "G14 Islamabad pakistan 40100": DeliveryAddress.G14_ISLAMABAD_PAKISTAN_40100
});

enum DeviceType { POSTMAN, ANDROID }

final deviceTypeValues = EnumValues({
    "android": DeviceType.ANDROID,
    "POSTMAN": DeviceType.POSTMAN
});

enum PaymentMethod { EASYPAISA, CASH_ON_DELIVERY, PAYMENT_METHOD_CASH_ON_DELIVERY, CASH, WALLET }

final paymentMethodValues = EnumValues({
    "cash": PaymentMethod.CASH,
    "Cash on delivery": PaymentMethod.CASH_ON_DELIVERY,
    "easypaisa": PaymentMethod.EASYPAISA,
    "Cash on Delivery": PaymentMethod.PAYMENT_METHOD_CASH_ON_DELIVERY,
    "Wallet": PaymentMethod.WALLET
});

class Product {
    Product({
        this.id,
        this.orderId,
        this.productId,
        this.description,
        this.productPrice,
        this.discountedPrice,
        this.quantity,
        this.name,
        this.shortDesc,
        this.longDesc,
        this.originalPrice,
        this.salePrice,
        this.defaultImage,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int orderId;
    int productId;
    dynamic description;
    int productPrice;
    String discountedPrice;
    int quantity;
    Name name;
    ShortDesc shortDesc;
    LongDesc longDesc;
    int originalPrice;
    dynamic salePrice;
    DefaultImage defaultImage;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        description: json["description"],
        productPrice: json["product_price"],
        discountedPrice: json["discounted_price"],
        quantity: json["quantity"],
        name: nameValues.map[json["name"]],
        shortDesc: shortDescValues.map[json["short_desc"]],
        longDesc: json["long_desc"] == null ? null : longDescValues.map[json["long_desc"]],
        originalPrice: json["original_price"],
        salePrice: json["sale_price"],
        defaultImage: json["default_image"] == null ? null : defaultImageValues.map[json["default_image"]],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "description": description,
        "product_price": productPrice,
        "discounted_price": discountedPrice,
        "quantity": quantity,
        "name": nameValues.reverse[name],
        "short_desc": shortDescValues.reverse[shortDesc],
        "long_desc": longDesc == null ? null : longDescValues.reverse[longDesc],
        "original_price": originalPrice,
        "sale_price": salePrice,
        "default_image": defaultImage == null ? null : defaultImageValues.reverse[defaultImage],
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum DefaultImage { PRODUCT_IMAGES }

final defaultImageValues = EnumValues({
    "product_images/": DefaultImage.PRODUCT_IMAGES
});

enum LongDesc { ABC }

final longDescValues = EnumValues({
    "abc": LongDesc.ABC
});

enum Name { CHICKEN_BIRYANI, BIRYANI, BURGER_2, ZINGER_BURGER, BURGER, NAME_BURGER }

final nameValues = EnumValues({
    "biryani": Name.BIRYANI,
    "burger": Name.BURGER,
    "burger 2": Name.BURGER_2,
    "Chicken Biryani": Name.CHICKEN_BIRYANI,
    "Burger": Name.NAME_BURGER,
    "Zinger burger": Name.ZINGER_BURGER
});

enum ShortDesc { CHICKEN_BIRYANI_SINGLE, BIRYANI, BURGER, SPICY_BURGER, SHORT_DESC_BURGER }

final shortDescValues = EnumValues({
    "biryani": ShortDesc.BIRYANI,
    "burger": ShortDesc.BURGER,
    "Chicken biryani Single": ShortDesc.CHICKEN_BIRYANI_SINGLE,
    "Burger": ShortDesc.SHORT_DESC_BURGER,
    "spicy burger": ShortDesc.SPICY_BURGER
});

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

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
