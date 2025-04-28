import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/providers/event_list_provider.dart';
import 'package:evently/screens/home%20screen/common/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/model/event.dart';
import '../../../core/providers/change_lang.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

import '../../../firebase/firebase_utils.dart';
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
    var eventListProvider= Provider.of<EventListProvider>(context);
    if(eventListProvider.getEventList.isEmpty){
      eventListProvider.getAllEvent();
    }
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
        preferredSize: Size.fromHeight(height * 0.17),
        child: Container(
          height: height,
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
                itemCount: eventListProvider.getEventList.length,
                itemBuilder: (context, index) {
                  return EventItem(event: eventListProvider.getEventList[index],);
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
