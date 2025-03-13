import 'dart:ui';

import 'package:news_cleanarch/core/assets_manager.dart';

class CategoryModel {
  String title;
  String id;
  String imagePath;
  TextDirection textDirection;

  CategoryModel(
      {required this.title,
      this.textDirection = TextDirection.ltr,
      required this.id,
      required this.imagePath});

  static List<CategoryModel> categories = [
    CategoryModel(
        title: 'General', id: 'general', imagePath: AssetsManager.erth),
    CategoryModel(
        title: 'Business',
        id: 'business',
        imagePath: AssetsManager.bss,
        textDirection: TextDirection.rtl),
    CategoryModel(title: 'Sports', id: 'sports', imagePath: AssetsManager.mssi),
    CategoryModel(
        title: 'Technology',
        id: 'technology',
        imagePath: AssetsManager.tech,
        textDirection: TextDirection.rtl),
    CategoryModel(
        title: 'Science', id: 'science', imagePath: AssetsManager.tel),
    CategoryModel(
        title: 'Health', id: 'health', imagePath: AssetsManager.dr,textDirection: TextDirection.rtl),
    CategoryModel(
        title: 'Entertainment', id: 'entertainment', imagePath: AssetsManager.ppCrn)
  ];
}
