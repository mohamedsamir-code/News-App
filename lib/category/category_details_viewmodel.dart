import 'package:flutter/material.dart';
import 'package:news_app/api_manager.dart';

import '../model/SourceResponse.dart';

class CategoryDetailsScreenViewModel extends ChangeNotifier {
  List<Sources>? sourceList;

  void getSource(String categoryID) async {
    try {
      var response = await ApiManager.getSources(categoryID);
      sourceList = response.sources;
    } catch (e) {
      throw (e);
    }
    notifyListeners();
  }
}
