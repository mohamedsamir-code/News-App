import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/news/news_details.dart';
import 'package:provider/provider.dart';

import '../model/SourceResponse.dart';
import '../mytheme.dart';
import '../provider/provider.dart';
import 'news_item.dart';

class NewsContainer extends StatefulWidget {
  Sources source;
  String searchKey;
  NewsContainer({super.key, required this.source, required this.searchKey});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder(
      future:
          ApiManager().getNews(widget.source.id ?? '', widget.searchKey ?? ''),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Something went Wrong'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Try again!!'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.primaryLightColor))
              ],
            ),
          );
        } else if (snapshot.data?.status != 'ok') {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Try again!!'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.primaryLightColor))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NewsDetails.routeName,
                    arguments: newsList[index],
                  );
                },
                child: NewsItem(news: newsList[index]));
          },
          itemCount: newsList.length,
        ));
      }),
    );
  }
}
