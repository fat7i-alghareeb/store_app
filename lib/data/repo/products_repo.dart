import '../models/product.dart';
import '../services/products_services.dart';

class ProductRepo {
  final ProductsServices productsServices;

  ProductRepo({required this.productsServices});

  Future<List<Product>> getAllProducts() async {
    final products =
        await productsServices.getMethod('https://dummyjson.com/products');
    //print(products.map((product) => Product.fromJson(product)).toList());
    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getCategorizeProduct(String category) async {
    final products = await productsServices
        .getMethod('https://dummyjson.com/products/category/$category');
    return products.map((product) => Product.fromJson(product)).toList();
  }
}
