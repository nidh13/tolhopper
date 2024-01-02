import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollhopper/core/services/injection_container.dart';
import 'package:tollhopper/features/news_tab/presentation/bloc/news_bloc.dart';
import 'package:tollhopper/features/news_tab/presentation/news_tab_ui.dart';
import 'package:tollhopper/global/common_widgets/error_widget/no_conexion_widget.dart';
import 'package:tollhopper/global/common_widgets/loading_screen/loading_screen.dart';
import 'package:tollhopper/global/common_widgets/snack_bar/app_snack_bar.dart';
import 'package:tollhopper/global/utils/functions.dart';

class NewsTabPage extends StatelessWidget {
  const NewsTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = getLocaleLanguageCode(context);
    return BlocProvider(
      create: (context) => sl<NewsBloc>()..add(GetNewsEvent(locale)),
      child: BlocListener<NewsBloc, NewsState>(
        listener: (context, state) async {
          if (state is NewsErrorState) {
            AppSnackBar.showSnackBar(context, state.message);
          }
        },
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const LoadingScreen();
            } else if (state is AllNewsSuccessLoaded) {
              return NewsPageTabUi(news: state.news);
            } else if (state is NewsErrorState) {
              return NoConnexionWidget(
                text: state.message,
                icon: Icons.cloud_off,
                tryAgain: () => tryAgain(context, locale),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void tryAgain(BuildContext context, String locale) {
    BlocProvider.of<NewsBloc>(context).add(GetNewsEvent(locale));
  }
}
