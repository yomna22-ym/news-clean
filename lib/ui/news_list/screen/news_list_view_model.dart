import 'package:flutter/material.dart';
import 'package:news_cleanarch/core/remote/api_manager.dart';

class NewsListViewModel extends ChangeNotifier {
  getSources(String categoryId) async{
    var response = await ApiManager.getSources(categoryId);
    if(response?.status=='error'){

    }else{}
  }
}
