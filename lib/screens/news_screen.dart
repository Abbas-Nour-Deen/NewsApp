import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsapp/model/news.dart';

class SelectedNewsScreen extends StatelessWidget {
  final NewsModel news;
  const SelectedNewsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [imageWidget(), content(), footer()],
          ),
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.3,
          child: Hero(
            tag: news.url,
            child: CachedNetworkImage(
              imageUrl: news.image,
              placeholder: (context, url) => SvgPicture.asset(
                "assets/images/placeholder.svg",
                fit: BoxFit.cover,
              ),
              fadeInDuration: const Duration(milliseconds: 700),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Column(
        children: [
          Text(
            news.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.description,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(news.content)
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            news.source.name,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Text(
            news.publishedAt,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
