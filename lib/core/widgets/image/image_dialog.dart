import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:posts_app/generated/assets.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({
    super.key,
    required this.imgUrl,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        width: 400,
        height: 400,
        color: Colors.transparent,
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained * 1.0,
          maxScale: PhotoViewComputedScale.covered * 1.0,
          // enableRotation: true,
          scaleStateController: PhotoViewScaleStateController(),
          backgroundDecoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 6),
                blurRadius: 6,
              ),
            ],
          ),
          imageProvider: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ).image,
          errorBuilder: (context, error, stackTrace) => const Image(
            image: AssetImage(
              Assets.imagesDefault,
            ),
          ),
        ),
      ),
    );
  }
}
