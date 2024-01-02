import 'package:flutter/material.dart';
import 'package:tollhopper/features/faq/widgets/faq_ui.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: FAQUi(
        onTap: () => backButton(context),
        defaultTextSpanStyle: theme.textTheme.headline5,
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }
}
