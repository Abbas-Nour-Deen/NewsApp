import 'package:get/get.dart';
import 'package:newsapp/api/news_api.dart';
import 'package:newsapp/config.dart';

class NewsRepository extends GetxService {
  final NewsApi newsApi;

  NewsRepository({required this.newsApi});

  Future<Response> getLastetstNews() async {
    return await newsApi.fetchlatestNews(endpoint: endPoint);
  }

  Future<Response> getNewsBySearch({required String query}) async {
    return await newsApi.fetchlatestNews(
        endpoint:
            "api/v4/search?q=$query&lang=en&country=us&max=50&apikey=$apiKey");
  }
}
