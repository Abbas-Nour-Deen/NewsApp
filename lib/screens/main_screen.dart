import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/news_controller.dart';
import 'package:newsapp/widgets/news_item.dart';
import 'package:newsapp/widgets/serchbar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 15),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SearchBarWidget(),
              Expanded(
                child: GetBuilder<NewsController>(
                  init: NewsController(newsRepository: Get.find()),
                  builder: (controller) => controller.obx(
                      (state) => ListView.builder(
                            itemCount: controller.lastestNews.length,
                            itemBuilder: (context, index) {
                              return NewsItem(
                                  news: controller.lastestNews[index]);
                            },
                          ),
                      onEmpty: const Center(
                        child: Text("No results found!"),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
