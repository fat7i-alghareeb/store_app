import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/helper_extensions.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit? boxFit;
  final Alignment? alignment;
  const CachedImage({
    super.key,
    required this.url,
    this.boxFit,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.center,
      imageUrl: url,
      fit: boxFit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: context.onPrimaryColor(),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
