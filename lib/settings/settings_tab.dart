import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/mytheme.dart';
import 'package:provider/provider.dart';

import '../home/home_drawer.dart';
import '../model/category.dart';
import '../provider/provider.dart';
import 'LanguageBottomSheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);
  static const String routeName = 'setting_screen';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

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
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: HomeDrawer(setSelectedCategory: setSelectedCategory),
          ),
          body: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                // Container(
                //   color: Theme.of(context).primaryColor,
                //   height: MediaQuery.of(context).size.height * 0.1,
                //   width: MediaQuery.of(context).size.width,
                // ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      ShowLangageButtomSheet();
                    },
                    child: Container(
                      width: 90,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyTheme.primaryLightColor),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(provider.appLanguage == 'en'
                              ? 'English'
                              : 'العربية',style: TextStyle(color: MyTheme.primaryLightColor)),
                          Icon(Icons.arrow_drop_down_sharp,color: MyTheme.primaryLightColor,)
                        ],
                      ),
                    ),
                  ),
                ),
              ])))
    ]);
  }

  Category? selectedCategory;

  bool categoryIsSelected = false;

  void setSelectedCategory() {
    selectedCategory = null;
    categoryIsSelected = false;
    setState(() {});
  }

  void ShowLangageButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageButtomSheet();
        });
  }
}
