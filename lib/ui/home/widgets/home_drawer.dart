import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_cleanarch/core/assets_manager.dart';
import 'package:news_cleanarch/core/colors_manager.dart';
import 'package:news_cleanarch/core/strings_manager.dart';

class HomeDrawer extends StatefulWidget {
  final void Function() backHome;

  const HomeDrawer({required this.backHome});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme = 'light';
  String selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.textColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            height: 166.h,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              StringsManager.nwsApp,
              style: TextStyle(
                  fontSize: 24.sp,
                  color: ColorsManager.textColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    widget.backHome();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.home,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        StringsManager.goHome,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManager.theme,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Theme',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: Colors.white))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: selectedTheme,
                        borderRadius: BorderRadius.circular(16.r),
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        dropdownColor: ColorsManager.textColor,
                        hint: Text(StringsManager.chzTheme,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        items: [
                          DropdownMenuItem(
                            value: 'light',
                            child: Text(StringsManager.lit),
                          ),
                          DropdownMenuItem(
                              value: 'dark', child: Text(StringsManager.drk))
                        ],
                        onChanged: (value) {
                          selectedTheme = value!;
                          setState(() {});
                        }),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManager.lang,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      StringsManager.laNg,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: Colors.white))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: selectedLanguage,
                        borderRadius: BorderRadius.circular(16.r),
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        dropdownColor: ColorsManager.textColor,
                        hint: Text(StringsManager.chzLang,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        items: [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(StringsManager.eng),
                          ),
                          DropdownMenuItem(
                              value: 'ar', child: Text(StringsManager.arb))
                        ],
                        onChanged: (value) {
                          selectedLanguage = value!;
                          setState(() {});
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
