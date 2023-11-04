import 'package:flutter/material.dart';
import 'package:news_app/category/item_tab_widget.dart';
import 'package:news_app/news/news_container.dart';
import '../model/SourceResponse.dart';

class SourceTabWidget extends StatefulWidget {
  List<Sources> sourceList;
  String searchKey;
  SourceTabWidget({required this.sourceList, required this.searchKey});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      margin: EdgeInsets.all(12),
      child: DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourceList
                  .map((source) => itemTabWidget(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source)))
                  .toList(),
            ),
            NewsContainer(
                source: widget.sourceList[selectedIndex],
                searchKey: widget.searchKey),
          ],
        ),
      ),
    );
  }
}
