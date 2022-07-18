import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oro_gold/common/app_images.dart';
import 'package:shimmer/shimmer.dart';

class CacheImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? placeHolderSize;
  final BoxFit? fit;

  final Alignment alignment;
  const CacheImageWidget(
      this.imageUrl,
      {

      this.fit,
      this.height,
      this.alignment = Alignment.center,
      this.placeHolderSize,
      this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      colorBlendMode: BlendMode.xor,
      fit: fit,
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Image.asset(AppImages.appLogoImage),
        );
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {

        return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: width,
              height: height,
              color: Colors.white,
            ));
      },
      width: width,
      alignment: alignment,
      height: height,

    );
  }
}


