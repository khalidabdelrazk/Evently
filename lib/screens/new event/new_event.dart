import 'package:evently/core/providers/change_lang.dart';
import 'package:evently/screens/common/custom_button.dart';
import 'package:evently/screens/common/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../core/colors/app_colors.dart';
import '../common/tabbar_item.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescController = TextEditingController();
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var changeLang = Provider.of<ChangeLang>(context);
    List<String> tabBarItems = [
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
    List<String> images = [
      'assets/img/sport.png',
      'assets/img/Birthday2.png',
      'assets/img/meeting.png',
      'assets/img/gaming.png',
      'assets/img/workshop.png',
      'assets/img/book club.png',
      'assets/img/exhibtation.png',
      'assets/img/holiday.png',
      'assets/img/eating.png',
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height * 0.25,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Image.asset(images[selectedIndex], fit: BoxFit.cover),
              ),
              SizedBox(height: height * 0.02),
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
                          selectedColor:
                              changeLang.isDark
                                  ? AppColors.darkBlue
                                  : AppColors.white,
                          unSelectedColor: AppColors.primaryColor,
                          selectedBackgroundColor: AppColors.primaryColor,
                          unSelectedBackgroundColor:
                              changeLang.isDark
                                  ? Colors.transparent
                                  : AppColors.white,
                          borderColor: AppColors.primaryColor,
                        );
                      }).toList(),
                ),
              ),
              SizedBox(height: height * 0.02),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: TextStyle(
                        color:
                            changeLang.isDark ? Colors.white : AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      label: AppLocalizations.of(context)!.event_title,
                      controller: eventNameController,
                      labelColor: AppColors.gray,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.edit_note,
                      validator: titleValidator,
                      inputColor: changeLang.isDark ? AppColors.white: AppColors.black,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: TextStyle(
                        color:
                            changeLang.isDark ? Colors.white : AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      label: AppLocalizations.of(context)!.event_description,
                      controller: eventDescController,
                      labelColor: AppColors.gray,
                      keyboardType: TextInputType.text,
                      validator: titleValidator,
                      maxLength: 5,
                      inputColor:
                          changeLang.isDark ? AppColors.white : AppColors.black,
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color:
                              changeLang.isDark
                                  ? AppColors.white
                                  : AppColors.black,
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          AppLocalizations.of(context)!.event_date,
                          style: TextStyle(
                            color:
                                changeLang.isDark
                                    ? AppColors.white
                                    : AppColors.black,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            _pickDate(context);
                          },
                          child: Text(
                            selectedDate == null
                                ? AppLocalizations.of(context)!.choose_date
                                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color:
                              changeLang.isDark
                                  ? AppColors.white
                                  : AppColors.black,
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          AppLocalizations.of(context)!.event_time,
                          style: TextStyle(
                            color:
                                changeLang.isDark
                                    ? AppColors.white
                                    : AppColors.black,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            _pickTime(context);
                          },
                          child: Text(
                            selectedTime == null
                                ? AppLocalizations.of(context)!.choose_time
                                : selectedTime!.format(context),
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'Add Event',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print('Event title: ${eventNameController.text}');
                      print('Event description: ${eventDescController.text}');
                      print('Date: $selectedDate');
                      print('Time: $selectedTime');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? titleValidator(String? txt) {
    if (txt == null || txt.trim().isEmpty) {
      return AppLocalizations.of(context)!.empty_field;
    }
    return null;
  }
}
