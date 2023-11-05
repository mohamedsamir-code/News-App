import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryItemWidget extends StatelessWidget {
  Category category;
  int index;

  CategoryItemWidget({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
            bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0)),
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: 110,
          ),
          Text(
            category.title,
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
