import 'package:hive_flutter/hive_flutter.dart';
import '../models/product.dart';

class CartProductsRepo {
  final productBox = Hive.box<Product>("product_box");
  void saveProduct(Product product) {
    productBox.add(product);
  }

  List<Product> fetchCartProduct() {
    return productBox.values.toList();
  }

  void unSaveProduct(int index) {
    productBox.deleteAt(index);
  }
}
