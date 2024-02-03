import 'package:get/get.dart';
import 'package:palm/models/product_fav.dart';
import 'package:palm/services/database_service.dart';

class DatabaseController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();
  final products = <ProductFavotite>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    final productList = await _databaseService.getProducts();
    products.value = productList;
  }

  void addProduct(ProductFavotite product) async {
    await _databaseService.insertProduct(product);
    fetchProducts();
  }
}
