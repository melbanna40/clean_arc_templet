import 'package:flutter/material.dart';
import 'package:posts_app/core/media/cached_image_loader.dart';

class MediaWidget extends StatelessWidget {
  const MediaWidget({
    super.key,
    required this.data,
    this.height = double.infinity,
    this.width = double.infinity,
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
    this.loadingSize = 35,
  });

  final String? data;
  final BoxFit fit;
  final double height;
  final double width;
  final double loadingSize;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return CachedImageLoader(
      url: data ?? '',
      fit: fit,
      alignment: alignment,
      height: height,
      width: width,
      loadingSize: loadingSize,
    );
  }
}
