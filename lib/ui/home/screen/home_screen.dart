import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_cleanarch/core/assets_manager.dart';
import 'package:news_cleanarch/core/remote/api_manager.dart';
import 'package:news_cleanarch/core/strings_manager.dart';
import 'package:news_cleanarch/model/catogery_model.dart';
import 'package:news_cleanarch/ui/categories/screen/categories_widget.dart';
import 'package:news_cleanarch/ui/home/widgets/home_drawer.dart';
import 'package:news_cleanarch/ui/news_list/screen/news_list_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShowNewsList = false;
  CategoryModel? selectedCategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager.getSources('business');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(
        backHome: () {
          selectedCategory = null;
          isShowNewsList = false;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text(selectedCategory != null
            ? selectedCategory!.title
            : StringsManager.home),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetsManager.search,
              height: 24.h,
              width: 24.w,
            ),
          )
        ],
      ),
      body: isShowNewsList
          ? NewsListWidget(selectedCategory!)
          : CategoriesWidget(onCategorySelected),
    );
  }

  onCategorySelected(CategoryModel category) {
    setState(() {
      isShowNewsList = true;
      selectedCategory = category;
    });
  }
}
