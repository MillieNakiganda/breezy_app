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
  });
  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      memCacheWidth: width.cacheSize(context),
      memCacheHeight: height.cacheSize(context),
      maxWidthDiskCache: width.cacheSize(context),
      maxHeightDiskCache: height.cacheSize(context),
      fit: BoxFit.cover,
      imageUrl:
          'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',

      progressIndicatorBuilder: (context, url, progress) =>
          Center(child: CircularProgressIndicator(value: progress.progress)),
      placeholder: (context, url) => Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.theme.colorScheme.primary,
              Colors.black,
              context.theme.colorScheme.primary,
            ],
          ),
        ),
      ),
      errorBuilder: (context, url, error) => const Icon(Icons.error),
    );
  }
}
