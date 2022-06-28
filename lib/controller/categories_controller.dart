import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Models/add_category_model.dart';
import 'package:restaurant/Models/add_product_model.dart';
import 'package:restaurant/Models/product_list_model.dart';
import 'package:restaurant/Models/restaurant_categoryList_model.dart';
import 'package:restaurant/Models/update_product_model.dart';
import 'package:restaurant/services/categories_api.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CategoriesController extends GetxController {



  TextEditingController txtproductName = TextEditingController();
  TextEditingController txtshortDisc = TextEditingController();
  TextEditingController txtorignalPrice = TextEditingController();
  TextEditingController txtlongDisc = TextEditingController();


  CategoriesApi categoriesApi = CategoriesApi();
  RestaurantCategoryListModel restaurantCategoryListModel;
  AddCategoryModel addCategoryModel;
  AddProductModel addProductModel;
  ProductListModel productListModel;
  UpdateProductModel updateProductModel;

  bool isLoading;
  bool uploadLoading;
  int serviceId;
  int parentId;
  String productName;
  String productPage;
  String productId;

  String updateproductImage;
  String updateproductName;
  String updateproductshortDes;
  String updateproductprice;
  String updateproductlongdesc;


  setUpdateProductImage(String image){
     updateproductImage=image;
     update();

  }

  setUpdateProductName(String name){
     txtproductName.text=name;
     print("name is :$updateproductName");
     update();

  }
  setUpdateProductshortDes(String shortdes){
     txtshortDisc.text=shortdes;
     update();

  }
  setUpdateProductprice(String price){
     txtorignalPrice.text=price;
     update();

  }
  setUpdateProductlongdes(String longdes){
     txtlongDisc.text=longdes;
     update();

  }
  
  
   
   


  setLoading(bool value){
    isLoading=value;
    update();
  }
   setUploadLoading(bool value){
    uploadLoading=value;
    update();
  }

  setServiceId(int id) {
    serviceId = id;
    update();
  }

  setProductId(String id) {
    productId = id;
    update();
  }

  
  






  setParentId(int id) {
    parentId = id;
    update();
  }

  setProductName(String name) {
    productName = name;
    update();
  }

  setProductPage(String page) {
    productPage = page;
    update();
  }
  


  getCatrgoriesList() async {
    print('Category list calling');

    isLoading = true;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final companyId = sharedPreferences.getInt("company_id");

    print("company_id is : $companyId");

    restaurantCategoryListModel = await categoriesApi.getcategoryListApi({
      // "restaurant_id":restaurantId.toString(),
      "company_id": companyId.toString(),
    });
    isLoading = false;

    update();
  }

  adduploadCategories(String name, File imagePath, File coverImage) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final companyId = sharedPreferences.getInt("company_id");
    print("company id is : $companyId");
    print("name is : $name");
    print("image is : $imagePath");
    print("cover image is : $coverImage");

    addCategoryModel = await categoriesApi.addUploadCategoriesApi(
        name, companyId.toString(), "1", imagePath, coverImage);
  }

  addProduct(String name, File imagePath, String orignalPrice, String shortDesc,
      String longDesc) async {
    int price = int.parse(orignalPrice);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final companyId = sharedPreferences.getInt("company_id");

    print("company id is : $companyId");
    print("name is : $name");
    print("image is : $imagePath");
    print("Price is : $price");
    print("short desc is : $shortDesc");
    print("long desc is : $longDesc");
    print("service id is : $serviceId");

    addProductModel = await categoriesApi.addProductApi(
      serviceId.toString(),
      name,
      companyId.toString(),
      imagePath,
      price,
      shortDesc,
      longDesc,
    );
  }

  getProductList() async {
    print('Category list calling');

    isLoading = true;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final companyId = sharedPreferences.getInt("company_id");

    print("company_id is : $companyId");
    print("service id is : $serviceId");

    productListModel = await categoriesApi.getProductListApi({
      "company_id": companyId.toString(),
      "service_id": serviceId.toString(),
    });
    isLoading = false;

    update();
  }

  updateProduct(String name, File imagePath, String orignalPrice,
      String shortDesc, String longDesc,String productId) async {
    int price = int.parse(orignalPrice);
    String status="1";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final companyId = sharedPreferences.getInt("company_id");
  
    updateProductModel = await categoriesApi.updateProductApi(
    serviceId.toString(),name,price,imagePath,shortDesc,longDesc,companyId.toString(),
     productId,status
    
    );
  }
}
