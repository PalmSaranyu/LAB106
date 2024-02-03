import 'package:get/get.dart';
import 'package:palm/models/product_response.dart';
import 'package:palm/services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  final productResponse = ProductResponse().obs;

  void getAllProducts() async {
    try {
      final response = await _productService.fetchAllProduct(50);
      productResponse.value = response;
    } catch (e) {
      // TODO :: Handle the error
      print('Failed to get all products: $e');
    }
  }
}
