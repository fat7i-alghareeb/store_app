import 'package:flutter/material.dart';
import '../../../../../utils/assets.dart';

import '../../../../../utils/models/product.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.85),
      shadowColor: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AssetsImages.info,
                  height: 30,
                  color: Colors.teal,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "info",
                  style: TextStyle(
                    fontSize: 26,
                    // fontWeight: FontWeight.w900,
                    fontFamily: "font2",
                    color: Colors.teal,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            KeyValueText(
              keyText: "Name",
              valueText: product.title,
            ),
            KeyValueText(
              keyText: "Brand",
              valueText: product.brand,
            ),
            KeyValueText(
              keyText: "Price",
              valueText: product.price,
            ),
            KeyValueText(
              keyText: "Description",
              valueText: product.description,
            ),
          ],
        ),
      ),
    );
  }
}

class KeyValueText extends StatelessWidget {
  const KeyValueText({
    super.key,
    required this.keyText,
    required this.valueText,
  });
  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: keyText,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          color: Theme.of(context).colorScheme.secondary,
        ),
        children: [
          TextSpan(
            text: ": $valueText",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
