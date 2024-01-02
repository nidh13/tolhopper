import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class NewsBodyText extends StatelessWidget {
  final String text;
  const NewsBodyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyText1?.copyWith(
                  color: newsBlocColor, fontSize: 14.71, height: 1.19),
            ),
          )
        ],
      ),
    );
  }
}
