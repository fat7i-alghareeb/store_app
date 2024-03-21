import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/products_grid_view.dart';
import '../../../../utils/shimmer.dart';
import '../../../Navigator/presentation/view/widgets/drawer widgets/drawer.dart';
import '../manger/categories cubit/categories_cubit.dart';
import '../manger/categories cubit/categories_state.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryName;
  const CategoryProducts({super.key, required this.categoryName});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context)
        .fetchCategorizeProduct(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppBar(title: widget.categoryName),
          ];
        },
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesProductsLoaded) {
              return ProductsGridView(
                products: state.products,
                isScrollable: false,
              );
            } else if (state is CategoriesFailure) {
              return const Center(
                child: Text("fuck"),
              );
            } else {
              return const CategoryScreenShimmer();
            }
          },
        ),
      ),
    );
  }
}
