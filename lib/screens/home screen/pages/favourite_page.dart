import 'package:evently/core/providers/my_user.dart';
import 'package:evently/screens/common/custom_text_field.dart';
import 'package:evently/screens/home%20screen/common/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import '../../../core/providers/event_list_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final TextEditingController controller = TextEditingController();
  late MyUserProvider myUserProvider = Provider.of<MyUserProvider>(context,listen: false);

  @override
  void initState() {
    super.initState();
    // todo : Fetch favorite events on page initialization
    Provider.of<EventListProvider>(context, listen: false).getFavEvent(myUserProvider.myUser!.id);
  }

  @override
  Widget build(BuildContext context) {
    // Get the event list provider
    var eventListProvider = Provider.of<EventListProvider>(context);
    var langProvider = Provider.of<ChangeLang>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                label: 'Search For Event',
                controller: controller,
                prefixIcon: Icons.search_rounded,
                prefixIconColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: eventListProvider.getFavEventList.isEmpty
                    ? Center(
                  child: Text(
                    "There are no favourite events",
                    style: TextStyle(
                      fontSize: 18,
                      color: langProvider.isDark
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                )
                    : ListView.builder(
                  itemCount: eventListProvider.getFavEventList.length,
                  itemBuilder: (context, index) {
                    return EventItem(
                      event: eventListProvider.getFavEventList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
