import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/service_locator.dart';
import '../../data/repo/cart_products_repo_impl.dart';
import '../manger/cubit/cart_product_cubit.dart';
import '../manger/cubit/cart_product_state.dart';
import '../../../Navigator/presentation/view/widgets/slidable.dart';
import '../../../../shared/widgets/cart_product_widget.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [];

    return BlocProvider(
      create: (context) => CartProductCubit(getIt.get<CartProductsRepoImpl>())
        ..fetchCardProduct(),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [const CustomAppBar(title: "")];
        },
        body: BlocBuilder<CartProductCubit, CartProductState>(
          builder: (context, state) {
            products = BlocProvider.of<CartProductCubit>(context).cartProducts;
            if (products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SlidableWidget(
                      child: CartProductWidget(
                        product: products[index],
                      ),
                      deleteAction: (context) {
                        BlocProvider.of<CartProductCubit>(context)
                            .unSaveProduct(index);
                        HapticFeedback.vibrate();
                      },
                      confirmAction: (context) {
                        null;
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  '" There no items in the Cart "',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[350],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
