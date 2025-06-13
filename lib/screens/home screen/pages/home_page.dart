import 'package:evently/core/providers/event_list_provider.dart';
import 'package:evently/screens/home%20screen/common/event_item.dart';
import 'package:evently/screens/new%20event/new_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';
import '../../../core/providers/my_user.dart';
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
  late EventListProvider eventListProvider;
  late MyUserProvider userProvider;
  late List<String> eventTypes;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<MyUserProvider>(context);
    if (eventListProvider.getEventTypesList.isEmpty) {
      eventListProvider.initEventTypesList();
    }
    // Fetch events if the list is empty
    if (!eventListProvider.hasFetchedEvents) {
      eventListProvider.getAllEvent(userProvider.myUser!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var myUserProvider = Provider.of<MyUserProvider>(context);
    var langProvider = Provider.of<ChangeLang>(context);
    double height = MediaQuery.of(context).size.height;
    eventTypes = [
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.24),
        child: _buildAppBar(context, langProvider),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child:
                  eventListProvider.getEventList.isEmpty
                      ? Center(
                        child: Center(
                          child: Text(
                            "No Added Events yet",
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  langProvider.isDark
                                      ? AppColors.white
                                      : AppColors.black,
                            ),
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: eventListProvider.getEventList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => NewEvent(
                                        event:
                                            eventListProvider
                                                .getEventList[index],
                                        title:
                                            AppLocalizations.of(
                                              context,
                                            )!.editEvent,
                                        buttonText:
                                            AppLocalizations.of(
                                              context,
                                            )!.confirm,
                                        actions: [

                                            IconButton(
                                              onPressed: () async{
                                                await eventListProvider.deleteEvent(
                                                  eventListProvider
                                                      .getEventList[index],
                                                  myUserProvider.myUser!.id,
                                                );
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.delete),
                                            ),

                                        ],
                                      ),
                                ),
                              );
                            },
                            child: EventItem(
                              event: eventListProvider.getEventList[index],
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

  // Method to build the AppBar
  Widget _buildAppBar(BuildContext context, ChangeLang langProvider) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      // height: height,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color:
            langProvider.isDark ? AppColors.darkBlue : AppColors.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePage.customText(text: AppLocalizations.of(context)!.welcome),
          HomePage.customText(
            text: userProvider.myUser!.name,
            fontSize: 24,
            fontWeight: FontWeight.w700,
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
          _buildTabBar(),
        ],
      ),
    );
  }

  // Method to build TabBar
  Widget _buildTabBar() {
    return DefaultTabController(
      length: eventTypes.length,
      initialIndex: eventListProvider.getSelectedIndex,
      child: TabBar(
        dividerHeight: 0,
        padding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        dividerColor: Colors.transparent,
        automaticIndicatorColorAdjustment: false,
        indicatorColor: Colors.transparent,
        onTap: (value) {
          eventListProvider.changeSelectedIndex(value);
          eventListProvider.getAllEvent(userProvider.myUser!.id);
        },
        tabs:
            eventTypes.map((item) {
              return TabBarItem(
                txt: item,
                isSelected:
                    eventListProvider.getSelectedIndex ==
                    eventTypes.indexOf(item),
              );
            }).toList(),
      ),
    );
  }
}
