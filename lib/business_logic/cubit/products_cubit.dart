import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../data/models/product.dart';
import '../../data/repo/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo productRepo;
  List<Product> products = [];
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  List<Product> getAllProducts() {
    try {
      productRepo.getAllProducts().then(
        (products) {
          products
              .removeWhere((product) => !categories.contains(product.category));

          products.shuffle();
          emit(ProductsLoaded(products: products));
          this.products = products;
        },
      );
      return products;
    } catch (e) {
      emit(
        ProductsError(
          errorMessage: e.toString(),
        ),
      );
      return [];
    }
  }
}
