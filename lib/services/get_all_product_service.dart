import 'dart:convert';

import 'package:http/http.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AllProductsService {
  static Future<List<ProductModel>?> getAllProducts() async {
    List<dynamic> products = await Api.get(endPoint: 'products');
    print('//////////////////////////////////////');
    List<ProductModel> productsList = [];

    for (int i = 0; i < products.length; i++) {
      productsList.add(
        ProductModel.fromJson(products[i]),
      );
    }
    return productsList;
  }
}
