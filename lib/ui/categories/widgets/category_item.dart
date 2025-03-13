import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_cleanarch/core/colors_manager.dart';
import 'package:news_cleanarch/model/catogery_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final void Function(CategoryModel) onCategoryTap;

  const CategoryItem({required this.category, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: category.textDirection,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 198.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: ColorsManager.textColor),
        child: Row(
          children: [
            Image.asset(
              category.imagePath,
              width: 170.w,
              height: 198.h,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          onCategoryTap(category);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: EdgeInsets.zero),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: REdgeInsetsDirectional.only(start: 10),
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  color: ColorsManager.textColor,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 30.r,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: ColorsManager.textColor,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
