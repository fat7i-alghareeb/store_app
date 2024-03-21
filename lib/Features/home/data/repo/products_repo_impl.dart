import 'package:store/Features/home/data/repo/products_repo.dart';

import '../../../../utils/services/products_services.dart';
import '../../../../utils/models/product.dart';

class ProductRepoImpl implements ProductsRepo {
  final ProductsServices productsServices;

  ProductRepoImpl({required this.productsServices});

  @override
  Future<List<Product>> getAllProducts() async {
    final products =
        await productsServices.getMethod('https://dummyjson.com/products');
    //print(products.map((product) => Product.fromJson(product)).toList());
    return products.map((product) => Product.fromJson(product)).toList();
  }

  @override
  Future<List<Product>> getCategorizeProduct(String category) async {
    final products = await productsServices
        .getMethod('https://dummyjson.com/products/category/$category');
    return products.map((product) => Product.fromJson(product)).toList();
  }
}
