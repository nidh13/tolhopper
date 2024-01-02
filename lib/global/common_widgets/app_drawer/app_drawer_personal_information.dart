import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/utils/const.dart';

class DrawerPersonalInformation extends StatelessWidget {
  final String fullName;
  final String email;
  const DrawerPersonalInformation({
    Key? key,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: CachedNetworkImage(
                  imageUrl: urlImageForTest,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(color: blueTextColor),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: context.theme.textTheme.headline3?.copyWith(
                      color: drawerBlackText,
                      fontSize: 16,
                      height: 1.46,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    email,
                    style: context.theme.textTheme.headline4?.copyWith(
                      color: drawerGreyText,
                      height: 1,
                      letterSpacing: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: homeAppBarBorderColor,
          height: 0.7,
        ),
      ],
    );
  }
}
