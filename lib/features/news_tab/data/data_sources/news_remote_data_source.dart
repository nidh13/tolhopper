import 'package:http/http.dart' as http;
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/features/news_tab/data/models/news_model.dart';
import 'package:tollhopper/global/utils/app_api.dart';

abstract class NewsDataSource {
  Future<List<NewsModel>> getAllNews({required String locale});

  Future<NewsModel> getSpecificNews({
    required int id,
    required String locale,
  });
}

class NewsDataSourceImpl implements NewsDataSource {
  final http.Client client;

  NewsDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<NewsModel>> getAllNews({required String locale}) async {
    Map<String, String>? queryParams = {
      "populate": "*",
      "locale": locale,
    };

    final response = await client.get(
      Uri.https(contentDomainApi, newsApiBlogs, queryParams),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());

    return newsModelFromJson(response.body).data;
  }

  @override
  Future<NewsModel> getSpecificNews(
      {required int id, required String locale}) async {
    Map<String, dynamic> queryParams = {
      "populate": "*",
      "locale": locale,
      "filters[id][\$eq]": '$id',
    };

    final response = await client.get(
      Uri.https(contentDomainApi, newsApiBlogs, queryParams),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());

    return newsModelFromJson(response.body).data.first;
  }
}
