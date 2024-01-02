import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/image_netWork/image_netork_widget.dart';
import 'package:tollhopper/global/theme/themes.dart';

class NewsImageWidget extends StatelessWidget {
  final String imageUrl;
  const NewsImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appSwitchButtonsSecondButtonColor,
      ),
      child: ImageNetworkWidget(
        imageUrl: imageUrl,
      ),
    );
  }
}
