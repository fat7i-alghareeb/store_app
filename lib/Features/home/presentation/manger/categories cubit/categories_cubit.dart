import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/products_repo_impl.dart';
import '../../../../../utils/models/product.dart';
import 'categories_state.dart';
import '../../../../../constants.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  ProductRepoImpl productRepo;
  List<String> _categoriesName = [];
  List<String> _categoriesImage = [];
  final List<List<String>> _categories = [];
  List<Product> categorizeProduct = [];
  CategoriesCubit(this.productRepo) : super(CategoriesInitial());
  get categories {
    _categoriesName = categoriesAvailable.keys.toList();
    _categories.add(_categoriesName);
    _categoriesImage = categoriesAvailable.values.toList();
    _categories.add(_categoriesImage);
    return _categories;
  }

  void fetchCategorizeProduct(String category) {
    try {
      productRepo.getCategorizeProduct(category).then(
        (products) {
          emit(CategoriesProductsLoaded(products: products));
          categorizeProduct = products;
        },
      );
    } catch (e) {
      emit(CategoriesFailure());
    }
  }
}
