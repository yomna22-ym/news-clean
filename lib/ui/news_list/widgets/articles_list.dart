import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_cleanarch/core/remote/api_manager.dart';
import 'package:news_cleanarch/model/ArticaleResponse/Article.dart';
import 'package:news_cleanarch/model/sourcesResponse/Source.dart';
import 'package:news_cleanarch/ui/news_list/widgets/articale_item.dart';

class ArticlesList extends StatefulWidget {
  Source source;

  ArticlesList(this.source);

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(widget.source.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
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
          List<Article> articles = response?.articles ?? [];
          if (articles.isEmpty) {
            return Center(
              child: Text(
                'No articles found',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => ArticaleItem(
                    article: articles[index],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
              itemCount: articles.length);
        });
  }
}
