import 'package:flutter/material.dart';
import 'package:news_app/category/category_details_screen.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/provider.dart';
import 'package:provider/provider.dart';
import '../category/categories_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _searchBoolean = false; //add

  Widget _searchTextField() {
    //add
    return Container(
      height: 50,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(1),
      child: TextField(
        onChanged: (text) {
          searchWord = text;
          setState(() {});
        },
        cursorColor: MyTheme.primaryLightColor,
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.searchArticles,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // int data = (ModalRoute.of(context)?.settings.arguments ?? 0) as int;
    // var navigate = [
    //   CategoriesTab(onCategoryItemDetails: onCategoryItemDetails),
    //   SettingsTab()
    // ];

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
            title: (!_searchBoolean)
                ? Text(
                    selectedCategory == null
                        ? AppLocalizations.of(context)!.newsApp
                        : selectedCategory?.title ?? '',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                : _searchTextField(),
            centerTitle: true,
            actions: !_searchBoolean
                ? [
                    !categoryIsSelected
                        ? Container()
                        : IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                _searchBoolean = true;
                              });
                            })
                  ]
                : [
                    IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = false;
                          });
                        })
                  ]),
        drawer: Drawer(
          child: HomeDrawer(setSelectedCategory: setSelectedCategory),
        ),
        body: selectedCategory == null
            ? CategoriesTab(onCategoryItemDetails: onCategoryItemDetails)
        //navigate[data]
            : CategoryDetails(
                category: selectedCategory,
                searchKey: searchWord,
              ),
      ),
    ]);
  }

  Category? selectedCategory;
  bool categoryIsSelected = false;

  void onCategoryItemDetails(Category category) {
    selectedCategory = category;
    categoryIsSelected = true;
    setState(() {});
  }

  void setSelectedCategory() {
    selectedCategory = null;
    categoryIsSelected = false;
    setState(() {});
  }

  Articles? news;
  String searchWord = '';

  void newsDetailsSelected(Articles article) {
    news = article;
    setState(() {});
  }
}