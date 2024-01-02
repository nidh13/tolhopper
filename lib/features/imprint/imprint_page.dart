import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/imprint/presentation/widgets/imprint_ui.dart';

class ImprintPage extends StatelessWidget {
  const ImprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ImprintUi(
        onTap: () => backButton(context),
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.of(context).pop();
  }
}
