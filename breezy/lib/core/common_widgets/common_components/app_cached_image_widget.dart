import 'package:breezy/core/utils/app_extensions/image_extension.dart';
import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/theme_extensions.dart';

class AppCachedImageWidget extends StatelessWidget {
  const AppCachedImageWidget({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.isCircular = false,
  });
  final double height;
  final double width;
  final String imageUrl;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    final cacheWidth = width.cacheSize(context);
    final cacheHeight = height.cacheSize(context);

    return CachedNetworkImage(
      width: width,
      height: height,
      memCacheWidth: cacheWidth,
      memCacheHeight: cacheHeight,
      maxWidthDiskCache: cacheWidth,
      maxHeightDiskCache: cacheHeight,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      // progressIndicatorBuilder: (context, url, progress) => Center(
      //   child: CircularProgressIndicator(value: progress.progress),
      // ),
      placeholder: (context, url) => ColoredBox(
        color: context.theme.colorScheme.surfaceContainerLow,
        child: SizedBox(width: width, height: height),
      ),
      errorBuilder: (context, url, error) => SizedBox(
        width: width,
        height: height,
        child: const Icon(Icons.error),
      ),
      imageBuilder: (context, imageProvider) {
        final resized = ResizeImage(
          imageProvider,
          width: cacheWidth,
          height: cacheHeight,
          allowUpscaling: false,
        );

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircular ? null : BorderRadius.circular(12),
            image: DecorationImage(image: resized, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
