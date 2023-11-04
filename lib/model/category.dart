import 'dart:ui';
import 'package:news_app/mytheme.dart';
import 'package:flutter/material.dart';
class Category {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;
  Category(
      {required this.id,
        required this.backgroundColor,
        required this.imagePath,
        required this.title});

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          backgroundColor: MyTheme.redColor,
          imagePath: 'assets/images/ball.png',
          title: 'Sports'),
      Category(
          id: 'general',
          backgroundColor: MyTheme.blueColor,
          imagePath: 'assets/images/Politics.png',
          title: 'Politics'),
      Category(
          id: 'health',
          backgroundColor: MyTheme.pinkColor,
          imagePath: 'assets/images/health.png',
          title: 'Health'),
      Category(
          id: 'business',
          backgroundColor: MyTheme.brownColor,
          imagePath: 'assets/images/bussines.png',
          title: 'Business'),
      Category(
          id: 'entertainment',
          backgroundColor: MyTheme.babyblueColor,
          imagePath: 'assets/images/environment.png',
          title: 'Entertainment'),
      Category(
          id: 'science',
          backgroundColor: MyTheme.yellowColor,
          imagePath: 'assets/images/science.png',
          title: 'Science'),
    ];
  }
}