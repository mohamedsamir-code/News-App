import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NewsDetails extends StatelessWidget {
  static const String routeName = 'news_details';

  @override
  Widget build(BuildContext context) {
    Articles news =
        (ModalRoute.of(context)?.settings.arguments ?? '') as Articles;

    DateTime now = DateTime.now();
    DateTime publishedAtDate = DateTime.parse(news.publishedAt ?? '');

    Duration diff = now.difference(publishedAtDate);
    return Stack(children: [
      Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/main_background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            news.title ?? '',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(news.urlToImage ?? ''),
                  Text(
                    news.source?.name ?? '',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    news.title ?? '',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${diff.inHours} hours ago',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.description ?? '',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          var url = Uri.parse(news.url ?? '');
                          if (!await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch ${news.url}');
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.viewFullArticle,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
