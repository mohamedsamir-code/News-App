import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/settings/settings_tab.dart';

class HomeDrawer extends StatelessWidget {
  Function setSelectedCategory;

  HomeDrawer({required this.setSelectedCategory});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: width,
          height: height / 5,
          color: MyTheme.primaryLightColor,
          child: Text('${AppLocalizations.of(context)!.newsApp}!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                HomeScreen.routeName,
                arguments: 0,
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30,
                ),
                Text(AppLocalizations.of(context)!.categories,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                SettingsTab.routeName,
                arguments: 1,
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                Text(AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
