import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/cart_product_cubit.dart';
import '../../../data/models/product.dart';

class AddToCardWidget extends StatelessWidget {
  const AddToCardWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add to a shopping cart",
          style: TextStyle(
            fontSize: 24,
            //fontWeight: FontWeight.w900,
            // fontStyle: FontStyle.italic,
            fontFamily: "font2",
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<CartProductCubit>(context).saveProduct(product);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                content: Center(
                  child: Text(
                    "Added to the cart successfully ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            );
          },
          icon: Image.asset(
            'images/add-to-cart.png',
            height: 30,
            color: Colors.teal[300],
          ),
        ),
      ],
    );
  }
}
