import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/colors/app_colors.dart';
import 'package:evently/core/providers/change_lang.dart';
import 'package:evently/core/routes/route_names.dart';
import 'package:evently/screens/home%20screen/pages/favourite_page.dart';
import 'package:evently/screens/home%20screen/pages/home_page.dart';
import 'package:evently/screens/home%20screen/pages/map_page.dart';
import 'package:evently/screens/new%20event/new_event.dart';
import 'package:evently/screens/home%20screen/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/model/event.dart';
import '../../firebase/firebase_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    MapPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    var langProvider = Provider.of<ChangeLang>(context);
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.newEvent);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360),
          side: BorderSide(color: AppColors.white, width: 4),
        ),
        backgroundColor:
            langProvider.isDark ? AppColors.darkBlue : AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.white, size: 34),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 0,
        shape: CircularNotchedRectangle(),
        color:
            langProvider.isDark ? AppColors.darkBlue : AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(Icons.home, AppLocalizations.of(context)!.home, 0),
              buildNavItem(
                Icons.location_on,
                AppLocalizations.of(context)!.map,
                1,
              ),
              const SizedBox(width: 48),
              buildNavItem(
                Icons.favorite,
                AppLocalizations.of(context)!.love,
                2,
              ),
              buildNavItem(
                Icons.person,
                AppLocalizations.of(context)!.profile,
                3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = index == currentIndex;
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? AppColors.white : Colors.white70),
            isSelected
                ? Text(
                  label,
                  style: TextStyle(color: AppColors.white, fontSize: 12),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }


}
