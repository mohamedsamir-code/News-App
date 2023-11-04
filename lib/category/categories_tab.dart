import 'package:flutter/material.dart';
import 'package:news_app/category/category_item_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesTab extends StatelessWidget {
  Function onCategoryItemDetails;

  CategoriesTab({required this.onCategoryItemDetails});

  @override
  Widget build(BuildContext context) {

    var categoryList = Category.getCategories();
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.pickYourCategoryOfInterest,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        onCategoryItemDetails(categoryList[index]);
                      },
                      child: CategoryItemWidget(
                          category: categoryList[index], index: index));
                }),
          )
        ],
      ),
    );
  }
}
