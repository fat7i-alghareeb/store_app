import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cart_product_cubit.dart';
import '../../business_logic/cubit/cart_product_state.dart';
import '../widgets/slidable.dart';
import '../../data/models/product.dart';
import '../widgets/cart_product_widget.dart';
import '../widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartProductCubit>(context).fetchCardProduct();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
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
    );
  }
}
