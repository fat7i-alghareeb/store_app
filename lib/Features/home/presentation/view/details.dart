import 'package:flutter/material.dart';
import '../../../../utils/assets.dart';
import '../../../../shared/models/product.dart';
import '../../../../utils/constants.dart';
import '../../../details/presentation/view/widgets/add_to_cart.dart';
import '../../../details/presentation/view/widgets/details.dart';
import '../../../details/presentation/view/widgets/details_images.dart';
import '../../../details/presentation/view/widgets/info.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.teal[300],
            size: 25,
          ),
        ),
        title: Image.asset(
          categoriesAvailable[product.category] ?? AssetsImages.groceries,
          //fit: BoxFit.cover,
          height: 35,
          color: Colors.teal[300],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsImages(
              productImages: product.images,
              productId: product.id,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: AddToCardWidget(product: product),
            ),
            InfoWidget(product: product),
            const DetailsWidget()
          ],
        ),
      ),
    );
  }
}
