import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/cubit/cart_product_cubit.dart';
import '../data/models/product.dart';
import '../data/repo/cart_products_repo.dart';
import '../presentation/pages/details.dart';
import '../presentation/pages/search_screen.dart';
import '../business_logic/cubit/categories_cubit.dart';
import '../business_logic/cubit/products_cubit.dart';
import '../data/repo/products_repo.dart';
import '../data/services/products_services.dart';

import '../constants.dart';
import '../presentation/pages/category_product_screen.dart';
import '../presentation/pages/navigator.dart';

class AppRouter {
  late ProductRepo productRepo;
  late ProductsCubit productsCubit;
  late CartProductsRepo cartProductsRepo;
  AppRouter() {
    productRepo = ProductRepo(productsServices: ProductsServices());
    productsCubit = ProductsCubit(productRepo);
    cartProductsRepo = CartProductsRepo();
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainNavigator:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductsCubit(productRepo),
              ),
              BlocProvider(
                create: (context) => CartProductCubit(cartProductsRepo),
              ),
              BlocProvider(
                create: (context) => CategoriesCubit(productRepo),
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
              create: (context) => CartProductCubit(cartProductsRepo),
              child: DetailsScreen(product: product),
            );
          },
        );
      case categoryProducts:
        return MaterialPageRoute(
          builder: (_) {
            final String categoryName = settings.arguments as String;
            return BlocProvider(
              create: (context) => CategoriesCubit(productRepo),
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
                create: (context) => ProductsCubit(productRepo),
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
