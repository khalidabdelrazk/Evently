import 'package:evently/screens/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/providers/change_lang.dart';
import 'home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouritePage extends StatefulWidget {

  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  bool love = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(height: height*0.02,),
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
                                width: width * 0.12,
                                height: width * 0.12,
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
                                      text: AppLocalizations.of(context)!.twenty_one,
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
                                padding: EdgeInsets.only(left: 10),

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
                                      text: AppLocalizations.of(context)!.this_is_birthday,
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
                                        love ? Icons.favorite : Icons.favorite_border,
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
      ),
    );
  }
}
