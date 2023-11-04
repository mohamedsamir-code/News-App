import 'package:flutter/material.dart';
import 'package:news_app/mytheme.dart';

import '../model/SourceResponse.dart';

class itemTabWidget extends StatelessWidget {
  Sources source;
  bool isSelected;

  itemTabWidget({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? MyTheme.primaryLightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: MyTheme.primaryLightColor)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            fontSize: 15,
            color: isSelected ? Colors.white : MyTheme.primaryLightColor),
      ),
    );
  }
}
