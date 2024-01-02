import 'package:flutter/material.dart';
import 'package:tollhopper/features/checkout/presentation/widget/general_information/descriptif_text.dart';
import 'package:tollhopper/features/checkout/presentation/widget/general_information/titles/description_text_with_big_title.dart';
import 'package:tollhopper/features/checkout/presentation/widget/general_information/titles/description_title.dart';

class DescriptionTextBlocWidget extends StatelessWidget {
  final String text;
  final String title;
  final bool hasBigTitle;
  final bool toLeft;
  const DescriptionTextBlocWidget({
    Key? key,
    required this.text,
    required this.title,
    this.hasBigTitle = true,
    this.toLeft = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          !toLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        hasBigTitle
            ? DescriptionBigTitle(text: title)
            : DescriptionSmallTitle(text: title),
        SizedBox(
          height: hasBigTitle ? 10 : 3,
        ),
        DescriptionTextWidget(
          text: text,
          fontWeight: hasBigTitle ? FontWeight.w600 : FontWeight.w700,
        )
      ],
    );
  }
}
