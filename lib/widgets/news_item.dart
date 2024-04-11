import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:newsapp/model/news.dart';
import 'package:newsapp/screens/news_screen.dart';

class NewsItem extends StatelessWidget {
  final NewsModel news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(SelectedNewsScreen(
        news: news,
      )),
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Hero(
                    tag: news.url,
                    child: CachedNetworkImage(
                      imageUrl: news.image,
                      placeholder: (context, url) => SvgPicture.asset(
                        "assets/images/placeholder.svg",
                        fit: BoxFit.cover,
                      ),
                      fadeInDuration: const Duration(milliseconds: 700),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(news.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
