import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/utils/service_locator.dart';
import '../../Features/Cart/presentation/manger/cubit/cart_product_cubit.dart';
import '../models/product.dart';
import '../../Features/Cart/data/repo/cart_products_repo_impl.dart';
import '../../Features/details/presentation/view/details.dart';
import '../../Features/search/presentation/view/search_screen.dart';
import '../../Features/home/presentation/manger/categories cubit/categories_cubit.dart';
import '../../Features/home/presentation/manger/products cubit/products_cubit.dart';
import '../../Features/home/data/repo/products_repo_impl.dart';
import '../../constants.dart';
import '../../Features/home/presentation/view/category_product_screen.dart';
import '../../Features/Navigator/presentation/view/navigator.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainNavigator:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ProductsCubit(getIt.get<ProductRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    CartProductCubit(getIt.get<CartProductsRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    CategoriesCubit(getIt.get<ProductRepoImpl>()),
              )
            ],
            child: const MainNavigator(),
          ),
        );
      case detailsScreen:
        return MaterialPageRoute(
          builder: (_) {
            final Product product = settings.arguments as Product;
            return BlocProvider(
              create: (context) =>
                  CartProductCubit(getIt.get<CartProductsRepoImpl>()),
              child: DetailsScreen(product: product),
            );
          },
        );
      case categoryProducts:
        return MaterialPageRoute(
          builder: (_) {
            final String categoryName = settings.arguments as String;
            return BlocProvider(
              create: (context) =>
                  CategoriesCubit(getIt.get<ProductRepoImpl>()),
              child: CategoryProducts(
                categoryName: categoryName,
              ),
            );
          },
        );
      case searchScreen:
        return MaterialPageRoute(
          builder: (_) {
            final List<Product> products = settings.arguments as List<Product>;

            return BlocProvider(
                create: (context) =>
                    ProductsCubit(getIt.get<ProductRepoImpl>()),
                child: SearchScreen(products: products));
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
