import 'package:get/get.dart';
import 'package:newsapp/api/news_repo.dart';
import 'package:newsapp/model/news.dart';

class NewsController extends GetxController with StateMixin {
  final NewsRepository newsRepository;

  NewsController({required this.newsRepository});

  RxList<NewsModel> lastestNews = <NewsModel>[].obs;
  RxString searchQuery = "".obs;

  Future<void> fetchLatestNews() async {
    change(lastestNews, status: RxStatus.loading());

    final Response response = await newsRepository.getLastetstNews();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.body;
      List<dynamic> newsData = responseData['articles'];

      lastestNews.value =
          newsData.map((item) => NewsModel.fromJson(item)).toList();

      change(lastestNews, status: RxStatus.success());
    } else {
      change(lastestNews, status: RxStatus.error());
      Get.showSnackbar(GetSnackBar(
        message: response.statusText!,
        isDismissible: true,
        duration: const Duration(seconds: 1),
      ));
    }
  }

  Future<void> getNewsBysearchQuery() async {
    change(lastestNews, status: RxStatus.loading());

    final Response response = await newsRepository.getNewsBySearch(
        query: filterQuery(searchQuery.value));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.body;
      List<dynamic> newsData = responseData['articles'];

      lastestNews.value =
          newsData.map((item) => NewsModel.fromJson(item)).toList();

      if (lastestNews.isEmpty) {
        change(lastestNews, status: RxStatus.empty());
      } else {
        change(lastestNews, status: RxStatus.success());
      }
    } else if (response.statusCode == 204) {
      change(lastestNews, status: RxStatus.empty());
    } else {
      change(lastestNews, status: RxStatus.error());
      Get.showSnackbar(GetSnackBar(
        message: response.statusCode.toString(),
        isDismissible: true,
        duration: const Duration(seconds: 1),
      ));
    }
  }

  String filterQuery(String query) {
    query = query.trim();

    String encodedQuery = Uri.encodeQueryComponent(query);

    if (query.contains(RegExp(r'[^\w\s]'))) {
      return '"$encodedQuery"';
    } else {
      return encodedQuery;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchLatestNews();
  }
}
