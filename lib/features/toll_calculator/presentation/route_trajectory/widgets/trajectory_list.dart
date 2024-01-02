import 'package:flutter/material.dart';
import 'package:tollhopper/core/luch_url_utils/luch_url_utils.dart';
import 'package:tollhopper/features/home_tab/data/models/toll_vignettes_routes.dart';
import 'package:tollhopper/features/toll_calculator/presentation/route_trajectory/widgets/trajectory_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class TrajectoryList extends StatelessWidget {
  final int indexSelected;
  final void Function(int) selectTrajectory;
  final List<TollRoutesModel> listRoutes;
  const TrajectoryList(
      {Key? key,
      required this.indexSelected,
      required this.selectTrajectory,
      required this.listRoutes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listRoutes.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return TrajectoryListItem(
            isSelected: (index == indexSelected),
            seeOnMap: () => URLUtils.launchURL(
                listRoutes[index].summary?.url, LaunchMode.platformDefault),
            routeReference: listRoutes[index].summary?.name ?? "",
            duration: listRoutes[index].summary?.duration?.text ?? "",
            countryStart:
                (listRoutes[index].summary?.countries?.isNotEmpty == true)
                    ? listRoutes[index].summary?.countries?.first ?? ""
                    : "",
            countryDestination:
                (listRoutes[index].summary?.countries?.isNotEmpty == true)
                    ? listRoutes[index].summary?.countries?.last ?? ""
                    : "",
            distance: listRoutes[index].summary?.distance?.metric ?? "",
            onTap: () {
              selectTrajectory(index);
            },
          );
        });
  }
}
