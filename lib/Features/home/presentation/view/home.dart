import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/router/router_paths.dart';
import '../../../../utils/service_locator.dart';
import '../../../../shared/widgets/shimmer.dart';
import '../../data/repo/products_repo_impl.dart';
import '../manger/products cubit/products_cubit.dart';
import '../manger/products cubit/products_state.dart';

import '../../../../utils/models/product.dart';
import '../../../../shared/widgets/products_grid_view.dart';
import 'widgets/swiper_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepoImpl>(),
      )..getAllProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return LoadedView(
              products: state.products,
            );
          } else if (state is ProductsError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const MainScreenShimmer();
          }
        },
      ),
    );
  }
}

class MainScreenShimmer extends StatelessWidget {
  const MainScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget(
          paddingLTRB: const [0, 0, 0, 0],
          hight: MediaQuery.of(context).size.height * 0.47,
          width: double.infinity,
          borderRadius: 30,
        ),
        const ShimmerWidget(
          paddingLTRB: [17, 27, 30, 0],
          hight: 20,
          width: 160,
          borderRadius: 0,
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ShimmerWidget(
                      paddingLTRB: const [5, 5, 10, 5],
                      hight: (MediaQuery.of(context).size.height * 0.3),
                      width: (MediaQuery.of(context).size.width - 50) / 2,
                      borderRadius: 11,
                    ),
                    ShimmerWidget(
                      paddingLTRB: const [10, 5, 0, 5],
                      hight: (MediaQuery.of(context).size.height * 0.3),
                      width: (MediaQuery.of(context).size.width - 50) / 2,
                      borderRadius: 11,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LoadedView extends StatelessWidget {
  const LoadedView({
    super.key,
    required this.products,
  });
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    final x = MediaQuery.of(context).size.width;
    final count = products.length >= 30 ? 15 : (products.length + 1) / 2;

    double grideHeight = (x * 0.8) * count;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: grideHeight + 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SwiperWidget(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, KRouter.searchScreen,
                              arguments: BlocProvider.of<ProductsCubit>(context)
                                  .products);
                          HapticFeedback.heavyImpact();
                        },
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: 32,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Image.asset(
                          AssetsImages.menu,
                          height: 32,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 35),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.teal[50],
              ),
              child: const Text(
                "New Products :",
                style: TextStyle(
                  //color: Theme.of(context).colorScheme.secondary,
                  fontSize: 25,
                  fontFamily: "Font2",
                  // fontWeight: FontWeight.w500
                  //fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: grideHeight,
                    child: ProductsGridView(
                      products: products,
                      isScrollable: false,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
