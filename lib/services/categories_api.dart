import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:restaurant/Models/add_category_model.dart';
import 'package:restaurant/Models/add_product_model.dart';
import 'package:restaurant/Models/product_list_model.dart';
import 'package:restaurant/Models/restaurant_categoryList_model.dart';
import 'package:restaurant/Models/update_product_model.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesApi {
  AddCategoryModel addCategoryModel;
  RestaurantCategoryListModel restaurantCategoryListModel;
  AddProductModel addProductModel;
  ProductListModel productListModel;
  UpdateProductModel updateProductModel;

  Future<AddCategoryModel> addUploadCategoriesApi(String name, String companyId,
      String status, File image, File cover) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    String addCategoryUrl = ApiUrl.addCategoryUrl;

    print(addCategoryUrl);

    Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };

    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(addCategoryUrl),
    );
    request.headers.addAll(headers);

    //add text fields
    request.fields["name"] = name;
    request.fields["company_id"] = companyId;
    request.fields["status"] = status;

    //create multipart using filepath, string or bytes
    var catPic =
        await http.MultipartFile.fromPath("category_image", image.path);
    var coverPic = await http.MultipartFile.fromPath("cover_photo", image.path);

    //add multipart to request
    request.files.add(catPic);
    request.files.add(coverPic);

    var response = await request.send();

    //Get the response from the server

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print("responseString is: $responseString end response");

    var decodeResponse = jsonDecode(responseString);

    print("Decode response is $decodeResponse");

    addCategoryModel = AddCategoryModel.fromJson(decodeResponse);

    return addCategoryModel;
  }

  Future<RestaurantCategoryListModel> getcategoryListApi(
      Map<String, dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String categoryListUrl = ApiUrl.categoryListUrl;

    print(categoryListUrl);

    var response = await http.post(Uri.parse(categoryListUrl),
        body: data, headers: headers);
    final responseBody = response.body;
    final decodeResponse = jsonDecode(responseBody);
    restaurantCategoryListModel =
        RestaurantCategoryListModel.fromJson(decodeResponse);
    print(decodeResponse);

    return restaurantCategoryListModel;
  }

  Future<ProductListModel> getProductListApi(Map<String, dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String productListUrl = ApiUrl.productListUrl;

    print(productListUrl);

    var response = await http.post(Uri.parse(productListUrl),
        body: data, headers: headers);
    final responseBody = response.body;
    final decodeResponse = jsonDecode(responseBody);
    productListModel = ProductListModel.fromJson(decodeResponse);
    print(decodeResponse);

    return productListModel;
  }

  Future<AddProductModel> addProductApi(
      String serviceId,
      String name,
      String companyId,
      File imagePath,
      int originalPrice,
      String shortDesc,
      String longDesc) 
      async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };

    print("sending data is :  serive id ${serviceId}, product name: ${name}"
    " company id: ${companyId},  imagepath: ${imagePath}, price: ${originalPrice}"
    "short desc : ${shortDesc}, long desc: ${longDesc}");

    String addProductUrl = ApiUrl.addProductUrl;

    print(addProductUrl);

    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(addProductUrl),
    );
    request.headers.addAll(headers);

    //add text fields
    request.fields["name"] = name;
    request.fields["service_id"] = serviceId;
    request.fields["company_id"] = companyId;
    request.fields["original_price"] = originalPrice.toString();
    request.fields["short_desc"] = shortDesc;
    request.fields["long_desc"] = longDesc;

    //create multipart using filepath, string or bytes
    var catPic =
        await http.MultipartFile.fromPath("image_path", imagePath.path);

    //add multipart to request
    request.files.add(catPic);

    var response = await request.send();

    //Get the response from the server

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print("responseString is: $responseString end response");

    var decodeResponse = jsonDecode(responseString);

    print("Decode response is $decodeResponse");

    addProductModel = AddProductModel.fromJson(decodeResponse);

    return addProductModel;
  }

  Future<UpdateProductModel> updateProductApi(
      String serviceId,
      String name,
      int originalPrice,
      File imagePath,
      String shortDesc,
      String longDesc,
      String companyId,
      String productId,
      String status) async {
    print('UPDATE PRODUCT API CALLING ');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };

      print("sending data is :  serive id ${serviceId}, product name: ${name}"
    " price: ${originalPrice}, imagepath: ${imagePath},"
    "short desc : ${shortDesc}, long desc: ${longDesc}, company id: ${companyId}, "
    "product id: ${productId},  status: ${status},  ");


    String updateProductUrl = ApiUrl.updateProductUrl;

    print(updateProductUrl);

    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(updateProductUrl),
    );
    request.headers.addAll(headers);

    //add text fields
    
    request.fields["name"] = name;
    request.fields["service_id"] = serviceId;
    request.fields["company_id"] = companyId;
    request.fields["original_price"] = originalPrice.toString();
    request.fields["short_desc"] = shortDesc;
    request.fields["long_desc"] = longDesc;
    request.fields["id"] = productId;
    request.fields["status"] = status;

    //create multipart using filepath, string or bytes
    
    var catPic =imagePath!=null?
        await http.MultipartFile.fromPath("image_path", imagePath.path):null;

    //add multipart to request
    imagePath!=null?request.files.add(catPic):null;

    var response = await request.send();

    //Get the response from the server

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print("responseString is: $responseString end response");

    var decodeResponse = jsonDecode(responseString);

    print("Decode response is $decodeResponse");

    updateProductModel = UpdateProductModel.fromJson(decodeResponse);

    return updateProductModel;
  }
}
