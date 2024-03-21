import 'package:get_it/get_it.dart';
import '../Features/home/data/repo/products_repo_impl.dart';
import '../Features/Cart/data/repo/cart_products_repo_impl.dart';
import 'services/products_services.dart';

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
