import 'package:get/get.dart';
import 'package:madura_app/data/repositories/product/product_repository.dart';
import 'package:madura_app/features/shop/controllers/product_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductRepository());
    Get.put(ProductController());
  }
}
