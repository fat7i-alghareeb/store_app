import '../../../../shared/models/product.dart';

abstract class ProductsRepo {
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getCategorizeProduct(String category);
}
