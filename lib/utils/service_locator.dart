import 'package:get_it/get_it.dart';
import 'package:store/Features/home/data/repo/products_repo_impl.dart';
import 'package:store/Features/Cart/data/repo/cart_products_repo_impl.dart';
import 'package:store/utils/services/products_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ProductsServices>(ProductsServices());
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(
      productsServices: getIt.get<ProductsServices>(),
    ),
  );
  getIt.registerSingleton<CartProductsRepoImpl>(CartProductsRepoImpl());
}
