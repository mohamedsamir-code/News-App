import 'package:flutter/material.dart';
import 'package:news_app/category/category_item_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../mytheme.dart';

class CategoriesTab extends StatelessWidget {
  Function onCategoryItemDetails;

  CategoriesTab({required this.onCategoryItemDetails});
  static List<Category> getCategories(BuildContext context) {
    return [
      Category(
          id: 'sports',
          backgroundColor: MyTheme.redColor,
          imagePath: 'assets/images/ball.png',
          title: AppLocalizations.of(context)!.sports),
      Category(
          id: 'general',
          backgroundColor: MyTheme.blueColor,
          imagePath: 'assets/images/Politics.png',
          title: AppLocalizations.of(context)!.politics),
      Category(
          id: 'health',
          backgroundColor: MyTheme.pinkColor,
          imagePath: 'assets/images/health.png',
          title: AppLocalizations.of(context)!.health),
      Category(
          id: 'business',
          backgroundColor: MyTheme.brownColor,
          imagePath: 'assets/images/bussines.png',
          title: AppLocalizations.of(context)!.business),
      Category(
          id: 'entertainment',
          backgroundColor: MyTheme.babyblueColor,
          imagePath: 'assets/images/environment.png',
          title: AppLocalizations.of(context)!.entertainment),
      Category(
          id: 'science',
          backgroundColor: MyTheme.yellowColor,
          imagePath: 'assets/images/science.png',
          title: AppLocalizations.of(context)!.science),
    ];
  }
  @override
  Widget build(BuildContext context) {

    var categoryList = getCategories(context);
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
