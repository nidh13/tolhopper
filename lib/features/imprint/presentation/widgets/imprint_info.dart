import 'package:flutter/cupertino.dart';
import 'package:tollhopper/core/extensions/contexte_extensions.dart';
import 'package:tollhopper/global/theme/themes.dart';

class ImprintInfo extends StatelessWidget {
  final IconData icon;
  final String content;
  final void Function()? onTap;
  final TextStyle? textStyle;

  const ImprintInfo({
    Key? key,
    required this.icon,
    required this.content,
    this.onTap,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";

    return Row(
      children: [
        Text(
          bullet,
          style: context.theme.textTheme.headline3
              ?.copyWith(color: labelBlackColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Icon(icon, size: 18),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            content,
            style: textStyle ?? context.theme.textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
