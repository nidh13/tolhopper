import 'package:flutter/material.dart';
import 'package:tollhopper/features/route_plan_tab/presntation/route_plan_tab_ui.dart';

class RoutePlanTabPage extends StatefulWidget {
  const RoutePlanTabPage({Key? key}) : super(key: key);

  @override
  State<RoutePlanTabPage> createState() => _RoutePlanTabPageState();
}

class _RoutePlanTabPageState extends State<RoutePlanTabPage> {
  final TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RoutePlanTabUi(
      locationController: locationController,
    );
  }
}
