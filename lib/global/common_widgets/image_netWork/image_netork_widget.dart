import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const ImageNetworkWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: blueTextColor,
            size: 20,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
