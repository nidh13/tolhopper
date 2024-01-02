import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/global/common_widgets/image_netWork/image_netork_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';

class NewsDetailsImage extends StatelessWidget {
  final String imageUrl;
  const NewsDetailsImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
        color: appSwitchButtonsSecondButtonColor,
      ),
      child: ImageNetworkWidget(
        imageUrl: imageUrl,
      ),
    );
  }
}
