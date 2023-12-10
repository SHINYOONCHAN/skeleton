import 'package:skeleton/controller/controller.dart';
import 'package:skeleton/view/product_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('skeleton'),
        backgroundColor: Colors.amber[700],
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Obx(() => controller.isLoading.value
                ? _buildShimmerGrid()
                : _buildShimmerGrid()
            // : GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 10,
            //         crossAxisSpacing: 10),
            //     itemBuilder: (context, index) {
            //       return ProductTile(
            //         controller.productList[index],
            //       );
            //     },
            //     itemCount: controller.productList.length,
            //   ),
            ),
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Shimmer.fromColors(
        child: ProductTileShimmer(),
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.white,
      ),
    );
  }
}

class ProductTileShimmer extends StatelessWidget {
  const ProductTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 18,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                height: 18,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                width: 250,
                height: 18,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                width: 200,
                height: 18,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
