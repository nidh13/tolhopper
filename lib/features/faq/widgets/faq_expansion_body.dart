import 'package:flutter/material.dart';
import 'package:tollhopper/global/theme/themes.dart';

class FAQExpansionCardBody extends StatelessWidget {
  final String description;
  final List<Widget>? body;

  const FAQExpansionCardBody({
    Key? key,
    this.body,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: iconWithCircularBackgroundColor,
        border: Border(
          right: BorderSide(
            color: trajectoryCardBorderColor, // Color of the right border
            width: 1.0, // Width of the right border
          ),
          left: BorderSide(
            color: trajectoryCardBorderColor, // Color of the left border
            width: 1.0, // Width of the left border
          ),
          bottom: BorderSide(
            color: trajectoryCardBorderColor, // Color of the bottom border
            width: 1.0, // Width of the bottom border
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: theme.textTheme.headline5,
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: body != null,
            child: Column(
              children: body ?? [],
            ),
          ),
        ],
      ),
    );
  }
}
