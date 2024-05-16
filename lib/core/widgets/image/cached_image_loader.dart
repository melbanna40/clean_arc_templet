import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/core/widgets/image/image_dialog.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/generated/assets.dart';

class CachedImageLoader extends StatelessWidget {
  const CachedImageLoader({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
    this.loadingSize = 35,
  });

  final String url;
  final BoxFit fit;
  final double height;
  final double width;
  final double loadingSize;

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (url.isNotEmpty) {
      return GestureDetector(
        onLongPress: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return ImageDialog(
                imgUrl: url,
              );
            },
          );
        },
        child: ExtendedImage.network(
          url,
          height: height,
          width: width,
          fit: fit,
          alignment: alignment,
          loadStateChanged: (ExtendedImageState value) {
            if (value.extendedImageLoadState == LoadState.loading) {
              return LoadingWidget(
                size: loadingSize,
              );
            } else if (value.extendedImageLoadState == LoadState.failed) {
              return Image.asset(
                Assets.imagesDefault,
                height: height,
                width: width,
                fit: fit,
                alignment: alignment,
              );
            }
            return null;
          },
          cacheMaxAge: const Duration(days: 2),
          compressionRatio: 0.35,
          timeRetry: const Duration(milliseconds: 1500),
          cacheHeight: 45,
          cacheWidth: 45,
          enableMemoryCache: false,
          enableLoadState: false,
          clearMemoryCacheWhenDispose: true,
        ),
      );
    } else {
      return Image.asset(
        Assets.imagesDefault,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
      );
    }
  }
}
