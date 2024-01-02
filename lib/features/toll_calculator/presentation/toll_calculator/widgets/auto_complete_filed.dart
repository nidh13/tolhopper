import 'package:flutter/material.dart';
import 'package:tollhopper/global/common_widgets/laoding_app_widget.dart';
import 'package:tollhopper/global/google_map_bloc/data/models/predection_model.dart';

class AutoComplete extends StatelessWidget {
  final bool showList;
  final bool isLoading;
  final List<PredictionModel> listPredictions;
  final void Function(PredictionModel, BuildContext) selectPrediction;
  const AutoComplete(
      {Key? key,
      required this.isLoading,
      required this.showList,
      required this.listPredictions,
      required this.selectPrediction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ((showList || isLoading) && listPredictions.isNotEmpty)
        ? Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              height: 110,
              child: Card(
                child: showList
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: ListView.builder(
                            itemCount: listPredictions.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  selectPrediction(
                                      listPredictions[index], context);
                                },
                                child: Text(
                                    listPredictions[index].description ?? "",
                                    style: theme.textTheme.headline4),
                              );
                            }),
                      )
                    : (isLoading)
                        ? const AppLoadingWidget()
                        : const SizedBox(),
              ),
            ),
          )
        : const SizedBox();
  }
}
