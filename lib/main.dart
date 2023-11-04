import 'package:flutter/material.dart';
import 'package:news_app/category/category_details_screen.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/provider/provider.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'package:news_app/splash/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var provider = AppConfigProvider();
  provider.loadSettingConfig();
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return provider;
      },
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        CategoryDetails.routeName: (context) =>
            CategoryDetails(category: null, searchKey: ''),
        NewsDetails.routeName: (context) => NewsDetails(),
        Splash.routeName: (context) => Splash(),
        SettingsTab.routeName: (context) => SettingsTab(),
      },
      initialRoute: Splash.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
