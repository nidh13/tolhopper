import 'package:flutter/material.dart';

class OrderSummaryDisplayInformationTextBloc extends StatelessWidget {
  final String title;
  final String text;
  const OrderSummaryDisplayInformationTextBloc(
      {Key? key, required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                theme.textTheme.bodyText2?.copyWith(height: 1, fontSize: 12.95),
          ),
          Text(
            text,
            style: theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
