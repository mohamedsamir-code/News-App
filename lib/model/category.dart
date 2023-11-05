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
}