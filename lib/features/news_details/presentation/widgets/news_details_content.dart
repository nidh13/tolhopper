import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:tollhopper/global/theme/themes.dart';

class NewsDetailsContent extends StatelessWidget {
  final String title;
  final String description;
  const NewsDetailsContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: appGlobalTheme.textTheme.headline1,
          ),
          const SizedBox(height: 20),
          HtmlWidget(
            description,
            textStyle: appGlobalTheme.textTheme.subtitle2?.copyWith(
              color: labelBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
