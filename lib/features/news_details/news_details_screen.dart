import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/features/news_details/presentation/news_details_screen_ui.dart';
import 'package:tollhopper/features/news_tab/presentation/bloc/news_bloc.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/common_widgets/snack_bar/app_snack_bar.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';
import 'package:tollhopper/core/services/injection_container.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    Key? key,
    required this.id,
    required this.locale,
  }) : super(key: key);

  final int id;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NewsBloc>()
            ..add(
              GetSpecificNewsEvent(locale: locale, id: id),
            ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<NewsBloc, NewsState>(
            listener: (context, state) async {
              if (state is NewsErrorState) {
                AppSnackBar.showSnackBar(context, state.message);
              }
            },
          ),
        ],
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: CommonAppBar(
                  title: LocaleKeys.news_details_app_bar_name.tr(),
                  hasBackButton: true,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                body: state is NewsLoading
                    ? const Center(child: LoadingScreen())
                    : state is SingleNewsSuccessLoaded
                        ? NewsDetailsUi(news: state.news)
                        : const SizedBox.shrink(),
              ),
            );
          },
        ),
      ),
    );
  }
}
