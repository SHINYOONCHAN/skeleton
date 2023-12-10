import 'package:skeleton/model/product_model.dart';
import 'package:dio/dio.dart';

class Services {
  static Dio dio = Dio();

  static Future<List<Product>?> fetchProducts() async {
    try {
      var response = await dio.get(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      );

      if (response.statusCode == 200) {
        var jsonData = response.data;
        return jsonData
            .map<Product>((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
