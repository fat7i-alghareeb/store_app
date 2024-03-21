import 'package:flutter/material.dart';
import 'cached_image.dart';

import '../constants.dart';
import 'models/product.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  final bool isScrollable;
  const ProductsGridView({
    super.key,
    required this.products,
    required this.isScrollable,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: isScrollable
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 15,
        childAspectRatio: 0.65,
      ),
      itemCount: products.length >= 30 ? 30 : products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, detailsScreen, arguments: product);
      },
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 2,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.95),
        //color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                ),
                child: Hero(
                  tag: product.id,
                  child: CachedImage(
                    url: product.images[0],
                    boxFit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset(
                categoriesAvailable[product.category] ??
                    "images/categories/grocery-bag.png",
                height: 24,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                product.title,
                maxLines: 2,
                // softWrap: false,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 10),
              child: Text(
                '\$${product.price} USD',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  //fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
