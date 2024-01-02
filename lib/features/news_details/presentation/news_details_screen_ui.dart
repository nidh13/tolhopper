import 'package:flutter/material.dart';
import 'package:tollhopper/features/news_details/presentation/widgets/news_details_content.dart';
import 'package:tollhopper/features/news_details/presentation/widgets/news_details_image.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/global/utils/app_api.dart';

class NewsDetailsUi extends StatelessWidget {
  const NewsDetailsUi({
    Key? key,
    required this.news,
  }) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "$contentApiBaseUrl${news.attributes?.image?.data?.attributes?.formats?.medium?.url}";
    final String description = news.attributes?.description ?? '';
    final String title = news.attributes?.title ?? '';
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        NewsDetailsImage(imageUrl: imageUrl),
        const SizedBox(height: 10),
        NewsDetailsContent(
          title: title,
          description: description,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
