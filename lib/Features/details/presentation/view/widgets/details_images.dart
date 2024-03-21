import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/cached_image.dart';

class DetailsImages extends StatefulWidget {
  const DetailsImages({
    super.key,
    required this.productImages,
    required this.productId,
  });

  final List<dynamic> productImages;
  final String productId;
  @override
  State<DetailsImages> createState() => _DetailsImagesState();
}

class _DetailsImagesState extends State<DetailsImages> {
  int x = 0;
  void _moveImageForward() {
    setState(() {
      if (x == widget.productImages.length - 1) {
        x = 0;
      } else {
        x++;
      }
    });
  }

  void _moveImageBackward() {
    setState(() {
      if (x == 0) {
        x = widget.productImages.length - 1;
      } else {
        x--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double y = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10),
          child: Hero(
            tag: widget.productId,
            child: CachedImage(
              url: widget.productImages[x],
              boxFit: BoxFit.fitHeight,
              height: (y * 0.33),
              width: double.infinity,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _moveImageBackward,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: x,
              count: widget.productImages.length,
              effect: WormEffect(
                activeDotColor: Colors.teal[300]!,
                dotColor: Colors.teal[50]!,
                dotHeight: 20,
                dotWidth: 20,
              ),
            ),
            IconButton(
              onPressed: _moveImageForward,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 35,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
