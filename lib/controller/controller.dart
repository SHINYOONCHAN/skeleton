import 'package:get/get.dart';
import '../model/product_model.dart';
import 'package:skeleton/data/services.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading.value = true;

      var products = await Services.fetchProducts();

      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
