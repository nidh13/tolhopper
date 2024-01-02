import 'package:flutter/material.dart';
import 'package:tollhopper/core/services/app_routes.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/features/news_tab/domain/usecases/get_specific_news_use_case.dart';
import 'package:tollhopper/features/news_tab/presentation/widget/news_list_card.dart';
import 'package:tollhopper/global/utils/app_api.dart';
import 'package:tollhopper/global/utils/const.dart';
import 'package:tollhopper/global/utils/functions.dart';

class ListNewsWidget extends StatelessWidget {
  const ListNewsWidget({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    final locale = getLocaleLanguageCode(context);
    return ListView.builder(
      itemCount: news.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        NewsModel newsItem = news[index];
        return NewsListCard(
          imageUrl:
              "$contentApiBaseUrl${newsItem.attributes?.image?.data?.attributes?.formats?.small?.url}",
          isFirst: (index == 0),
          isLast: (index == news.length - 1),
          date: newsItem.attributes?.publishedAt == null
              ? ''
              : formatDateTimeToString(
                  dateTime: newsItem.attributes!.publishedAt!,
                  pattern: newsDateFormat,
                  locale: locale,
                ),
          content: news[index].attributes?.title ?? "",
          createdBy: testAuthor,
          readMore: () => goToNewsDetail(context, newsItem.id, locale),
        );
      },
    );
  }

  goToNewsDetail(BuildContext context, int id, String locale) {
    Navigator.pushNamed(
      context,
      newsDetail,
      arguments: GetSpecificNewsParam(locale: locale, id: id),
    );
  }
}
