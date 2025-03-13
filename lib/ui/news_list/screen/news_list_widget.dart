import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_cleanarch/core/colors_manager.dart';
import 'package:news_cleanarch/core/remote/api_manager.dart';
import 'package:news_cleanarch/model/catogery_model.dart';
import 'package:news_cleanarch/ui/news_list/widgets/articles_list.dart';

class NewsListWidget extends StatefulWidget {
  final CategoryModel category;

  NewsListWidget(this.category);

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.error.toString(),
                  style: TextStyle(fontSize: 16.sp, color: Colors.red)),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == 'error') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                response?.message ?? '',
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }
        var sources = response?.sources ?? [];
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: ColorsManager.textColor,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.textColor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.textColor,
                ),
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                tabs: sources.map((source) => Tab(text: source.name)).toList(),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: TabBarView(
                  children:
                      sources.map((source) => ArticlesList(source)).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
