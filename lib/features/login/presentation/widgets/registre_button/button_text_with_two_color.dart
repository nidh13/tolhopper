import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class ButtonTextWithTwoColors extends StatelessWidget {
  final String text;
  final String buttonTitle;
  final GestureTapCallback? onTap;

  const ButtonTextWithTwoColors(
      {Key? key,
      required this.text,
      required this.buttonTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              theme.textTheme.headline3?.copyWith(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 2,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            buttonTitle,
            style: theme.textTheme.headline3
                ?.copyWith(fontWeight: FontWeight.w600, color: appPrimaryColor),
          ),
        )
      ],
    );
  }
}
