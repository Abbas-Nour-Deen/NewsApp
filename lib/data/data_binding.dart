import 'package:get/get.dart';
import 'package:newsapp/api/news_api.dart';
import 'package:newsapp/api/news_repo.dart';
import 'package:newsapp/config.dart';
import 'package:newsapp/controllers/news_controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsApi(appBasUrl: baseApi));
    Get.lazyPut(() => NewsRepository(newsApi: Get.find()));
    Get.lazyPut(() => NewsController(newsRepository: Get.find()));
  }
}
