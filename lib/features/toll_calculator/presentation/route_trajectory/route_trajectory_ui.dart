import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/toll_calculator/presentation/route_trajectory/widgets/trajectory_list.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/buttons/global_app_button.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/theme/themes.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/global/utils/functions.dart';
import 'package:tollhopper/global/utils/google_maps_fucntions.dart';

class RouteTrajectoryUi extends StatelessWidget {
  final GestureTapCallback? backButtonOnTap;
  final VoidCallback? nextButtonOnTap;
  final void Function(int) selectTrajectory;
  final int indexSelected;
  final List<TollRoutesModel> listRoutes;
  final bool isLoading;
  const RouteTrajectoryUi(
      {Key? key,
      required this.backButtonOnTap,
      required this.nextButtonOnTap,
      required this.selectTrajectory,
      required this.indexSelected,
      required this.isLoading,
      required this.listRoutes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final polyLine =
        decodeGooglePolyLineString(listRoutes[indexSelected].polyline ?? "");
    List<Marker> markers = [
      Marker(
        markerId: const MarkerId('startMarker'),
        position: polyLine.first.points.first,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: const MarkerId('endMarker'),
        position: polyLine.first.points.last,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    ];
    return Scaffold(
      backgroundColor: globalBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
        title: LocaleKeys.route_trajectory_app_bar_title.tr(),
        hasBackButton: true,
        onTap: backButtonOnTap,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: calculateCameraPosition(polyLine.toList()),
                zoom: 3.5,
              ),
              polylines: polyLine,
              markers: Set<Marker>.of(markers),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.5),
                      child: TrajectoryList(
                        indexSelected: indexSelected,
                        listRoutes: listRoutes,
                        selectTrajectory: selectTrajectory,
                      ),
                    ),
                  ),
                  isLoading
                      ? const LoadingScreen()
                      : GlobalAppButton(
                          text: LocaleKeys.next.tr(),
                          onPressed: nextButtonOnTap,
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
