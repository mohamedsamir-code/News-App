import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              news.urlToImage ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            news.author ?? "",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            news.title ?? "",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            news.publishedAt ?? "",
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
