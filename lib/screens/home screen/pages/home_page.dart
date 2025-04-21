import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/tabbar_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Text customText({
    required String text,
    Color? color,
    int? fontSize,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.white,
        fontSize: fontSize?.toDouble() ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool love = false;
  @override
  Widget build(BuildContext context) {
    List<String> tabBarItems = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthDay,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    var langProvider = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.2),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color:
                langProvider.isDark
                    ? AppColors.darkBlue
                    : AppColors.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomePage.customText(
                      text: AppLocalizations.of(context)!.welcome,
                    ),
                    HomePage.customText(
                      text: AppLocalizations.of(context)!.john,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.013),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 5),
                    HomePage.customText(
                      text: AppLocalizations.of(context)!.cairo,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.013),

                DefaultTabController(
                  length: tabBarItems.length,
                  initialIndex: selectedIndex,
                  child: TabBar(
                    dividerHeight: 0,
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    automaticIndicatorColorAdjustment: false,
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                    tabs:
                        tabBarItems.map((item) {
                          return TabBarItem(
                            txt: item,
                            isSelected:
                                selectedIndex == tabBarItems.indexOf(item),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: height * 0.25,
                      width: width,
                      decoration: BoxDecoration(
                        color:
                            langProvider.isDark
                                ? Colors.transparent
                                : AppColors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/img/Birthday.png'),
                          scale: 5,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/Happy Whale.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              // width: width * 0.15,
                              // height: width * 0.15,
                              decoration: BoxDecoration(
                                color:
                                    langProvider.isDark
                                        ? Colors.transparent
                                        : AppColors.darkWhite,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  HomePage.customText(
                                    text:
                                        AppLocalizations.of(
                                          context,
                                        )!.twenty_one,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  HomePage.customText(
                                    text: AppLocalizations.of(context)!.nov,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width,
                              height: height * 0.045,
                              padding: EdgeInsets.symmetric(horizontal: 10),

                              decoration: BoxDecoration(
                                color:
                                    langProvider.isDark
                                        ? Colors.transparent
                                        : AppColors.darkWhite,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HomePage.customText(
                                    text:
                                        AppLocalizations.of(
                                          context,
                                        )!.this_is_birthday,
                                    color:
                                        langProvider.isDark
                                            ? AppColors.white
                                            : AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        love = !love;
                                      });
                                    },
                                    icon: Icon(
                                      love
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabItem({required String txt, bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.white, width: 2),
      ),
      child: Text(
        txt,
        style: TextStyle(
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/*
SizedBox(
                  height: height * 0.07,
                  child: ListView.builder(
                    itemCount: 7,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width / 5,
                          height: height * 0.00003,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                )
PreferredSize(
        preferredSize: Size.fromHeight(height * 0.18),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color:
            langProvider.isDark
                ? AppColors.darkBlue
                : AppColors.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(text: AppLocalizations.of(context)!.welcome),
                    customText(
                      text: AppLocalizations.of(context)!.john,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    SizedBox(width: 5),
                    customText(
                      text: AppLocalizations.of(context)!.cairo,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                  child: ListView.builder(
                    itemCount: 7,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width / 5,
                          height: height * 0.00003,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )
 */
