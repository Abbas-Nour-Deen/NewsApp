import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:newsapp/controllers/news_controller.dart';

class SearchBarWidget extends GetView<NewsController> {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: SearchBar(
        elevation: const MaterialStatePropertyAll(3),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
        leading: const Icon(Icons.search),
        hintText: "Search",
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        onChanged: (value) {
          if (value.isEmpty) {
            controller.fetchLatestNews();
          }
        },
        onSubmitted: (value) {
          if (value.isEmpty) {
            controller.fetchLatestNews();
            return;
          }
          controller.searchQuery.value = value;
          controller.getNewsBysearchQuery();
        },
      ),
    );
  }
}
