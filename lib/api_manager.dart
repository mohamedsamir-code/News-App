import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
  static const String baseURL = "newsapi.org";

  static Future<SourceResponse> getSources(
    String CategoryID,
  ) async {
    /// https://newsapi.org/v2/top-headlines/sources?apiKey=1b536739251c4721b284db0d2fdfdc52
    var url = Uri.https(baseURL, '/v2/top-headlines/sources', {
      'apiKey': 'db1248d9103c4e18b48f0fba2b1a5ecc',
      'category': CategoryID,
    });

    try {
      var response = await http.get(url);
      var bodyString = response.body; // string must be json
      var json = jsonDecode(bodyString); // I have the json
      var sourceResponse = SourceResponse.fromJson(json);

      /// source response object

      return sourceResponse;
    } catch (e) {
      throw (e);
    }
  }

  Future<NewsResponse> getNews(String sourceID, String searchKey) async {
    var url = Uri.https(baseURL, 'v2/everything', {
      'apiKey': '1b536739251c4721b284db0d2fdfdc52',
      'sources': sourceID,
      'q': searchKey,
    });

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw (e);
    }
  }
}
