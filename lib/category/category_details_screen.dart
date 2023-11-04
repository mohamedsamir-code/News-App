import 'package:flutter/material.dart';
import 'package:news_app/category/category_details_viewmodel.dart';
import 'package:news_app/category/source_tabs.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_details';
  Category? category;
  String searchKey;

  CategoryDetails({super.key, required this.category, required this.searchKey});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsScreenViewModel viewModel = CategoryDetailsScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsScreenViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.sourceList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return SourceTabWidget(
                sourceList: viewModel.sourceList!, searchKey: widget.searchKey);
          }
        },
      ),
    );

    // FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(widget.category?.id ?? ''),
    //   builder: ((context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child:
    //             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //           Text("Something Went Wrong"),
    //           ElevatedButton(
    //               onPressed: () {
    //                 setState(() {});
    //               },
    //               child: Text("Try again"),
    //               style: ElevatedButton.styleFrom(
    //                   backgroundColor: MyTheme.primaryLightColor))
    //         ]),
    //       );
    //     } else if (snapshot.data?.status != 'ok') {
    //       return Center(
    //         child:
    //             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //           Text(snapshot.data?.message ?? ""),
    //           ElevatedButton(
    //               onPressed: () {
    //                 setState(() {});
    //               },
    //               child: Text("Try again"),
    //               style: ElevatedButton.styleFrom(
    //                   backgroundColor: MyTheme.primaryLightColor))
    //         ]),
    //       );
    //     } // I have data
    //     else {
    //       var sourceList = snapshot.data?.sources ?? [];
    //       return SourceTabWidget(
    //           sourceList: sourceList, searchKey: widget.searchKey);
    //     }
    //   }),
    // );
  }
}
