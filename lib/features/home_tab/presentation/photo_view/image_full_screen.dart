import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tollhopper/global/theme/themes.dart';

class FullScreenImage extends StatelessWidget {
  final String image;

  const FullScreenImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.94),
        leading: const SizedBox.shrink(),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 8),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.close,
                size: 22,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: PhotoViewGallery(
          pageController: PageController(),
          scrollPhysics: const BouncingScrollPhysics(),
          pageOptions: [
            PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(
                image,
              ),
              // replace with your image URL
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ],
          backgroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(.94),
          ),
          loadingBuilder: (context, event) => Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: blueTextColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
