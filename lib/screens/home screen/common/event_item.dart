import 'package:evently/core/model/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import '../pages/home_page.dart';

class EventItem extends StatelessWidget {
  final Event event;
  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<ChangeLang>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: height * 0.25,
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: langProvider.isDark ? Colors.transparent : AppColors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryColor, width: 2),
          image: DecorationImage(
            image: AssetImage(event.image),
            scale: 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
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
                    text: event.dateTime.day.toString(),
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  HomePage.customText(
                    text: DateFormat(' MMM ').format(event.dateTime),
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
                children: [
                  Expanded(
                    child: HomePage.customText(
                      text: event.title,
                      color:
                      langProvider.isDark
                          ? AppColors.white
                          : AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // setState(() {
                      //   love = !love;
                      // });
                    },
                    icon: Icon(Icons.favorite_border, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
