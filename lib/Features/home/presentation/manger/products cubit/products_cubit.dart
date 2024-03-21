import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/home/data/repo/products_repo_impl.dart';

import '../../../../../utils/models/product.dart';
import '../../../../../constants.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepoImpl productRepo;
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
