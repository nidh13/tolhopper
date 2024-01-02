import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/features/news_tab/presentation/widget/news_list.dart';
import 'package:tollhopper/global/common_widgets/app_bars/common_app_bar_widget.dart';
import 'package:tollhopper/global/translation/generated/locale_keys.g.dart';

class NewsPageTabUi extends StatelessWidget {
  const NewsPageTabUi({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CommonAppBar(
            title: LocaleKeys.news_app_bar_title.tr(),
          ),
          body: ListNewsWidget(news: news),
        ),
      ),
    );
  }
}
