import 'package:flutter/material.dart';
import '../../utils/assets.dart';

import '../../utils/constants.dart';
import '../models/product.dart';
import '../../utils/cached_image.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(1),
        elevation: 5,
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              CachedImage(
                url: product.images[0],
                boxFit: BoxFit.fitHeight,
                height: 140,
                width: 180,
                alignment: Alignment.centerLeft,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        product.title,
                        maxLines: 2,
                        //softWrap: false,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        '\$${product.price} USD',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          //fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Image.asset(
                        categoriesAvailable[product.category] ??
                            AssetsImages.groceries,
                        height: 24,
                        color: Colors.teal[200],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
