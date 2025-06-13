import 'package:evently/core/model/event.dart';
import 'package:evently/core/providers/change_lang.dart';
import 'package:evently/core/providers/my_user.dart';
import 'package:evently/core/routes/route_names.dart';
import 'package:evently/firebase/firebase_utils.dart';
import 'package:evently/screens/common/custom_button.dart';
import 'package:evently/screens/common/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../core/colors/app_colors.dart';
import '../../core/providers/event_list_provider.dart';
import '../common/tabbar_item.dart';

class NewEvent extends StatefulWidget {
  final Event? event;
  final String? title;
  final String? buttonText;
  final List<Widget>? actions;
  const NewEvent({super.key, this.event, this.title, this.buttonText, this.actions});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final _formKey = GlobalKey<FormState>();
  late ChangeLang changeLang;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescController = TextEditingController();
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late EventListProvider eventListProvider;
  late MyUserProvider myUserProvider;
  late double height;
  late double width;
  late List<String> eventTypes;
  final List<String> images = [
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

  @override
  void initState() {
    super.initState();
    eventNameController = TextEditingController(
      text: widget.event?.title ?? '',
    );
    eventDescController = TextEditingController(
      text: widget.event?.description ?? '',
    );
    selectedDate = widget.event?.dateTime;
    selectedTime = timeFromString(widget.event?.time);
    selectedIndex =
        !images.contains(widget.event?.image ?? '')
            ? 0
            : images.indexOf(widget.event?.image ?? '');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    eventListProvider = Provider.of<EventListProvider>(context);
  }

  TimeOfDay? timeFromString(String? timeString) {
    if (timeString == null || !timeString.contains(':')) return null;
    final parts = timeString.split(':');
    if (parts.length != 2) return null;
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) return null;
    return TimeOfDay(hour: hour, minute: minute);
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              onSurface: changeLang.isDark ? AppColors.white : AppColors.black,
              surface: changeLang.isDark ? AppColors.darkBlue : AppColors.white,
            ),
          ),
          child: child!,
        );
      },
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
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              onSurface: changeLang.isDark ? AppColors.white : AppColors.black,
              surface: changeLang.isDark ? AppColors.darkBlue : AppColors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Widget dateTimeWidgets({
    required IconData icon,
    required String textTitle,
    required String textChoose,
    required void Function() onPressed,
  }) {
    myUserProvider = Provider.of<MyUserProvider>(context);
    return Row(
      children: [
        Icon(
          icon,
          color: changeLang.isDark ? AppColors.white : AppColors.black,
        ),
        SizedBox(width: width * 0.02),
        Text(
          textTitle,
          style: TextStyle(
            color: changeLang.isDark ? AppColors.white : AppColors.black,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            textChoose,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  AppBar myAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      title: Text(
        widget.title ?? AppLocalizations.of(context)!.create_event,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: widget.actions,
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    myUserProvider = Provider.of<MyUserProvider>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    changeLang = Provider.of<ChangeLang>(context);
    eventTypes = [
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
      appBar: myAppBar(),

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
                length: eventTypes.length,
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
                      eventTypes.map((item) {
                        return TabBarItem(
                          txt: item,
                          isSelected: selectedIndex == eventTypes.indexOf(item),
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
                      prefixIconColor:
                          changeLang.isDark ? AppColors.white : AppColors.black,
                      validator: titleValidator,
                      inputColor:
                          changeLang.isDark ? AppColors.white : AppColors.black,
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
                      maxLines: 5,
                      inputColor:
                          changeLang.isDark ? AppColors.white : AppColors.black,
                    ),
                    SizedBox(height: height * 0.02),
                    dateTimeWidgets(
                      icon: Icons.calendar_month_outlined,
                      textChoose:
                          selectedDate == null
                              ? AppLocalizations.of(context)!.choose_date
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      textTitle: AppLocalizations.of(context)!.event_date,
                      onPressed: () {
                        _pickDate(context);
                      },
                    ),
                    dateTimeWidgets(
                      icon: Icons.access_time,
                      textChoose:
                          selectedTime == null
                              ? AppLocalizations.of(context)!.choose_time
                              : selectedTime!.format(context),
                      textTitle: AppLocalizations.of(context)!.event_time,
                      onPressed: () {
                        _pickTime(context);
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(
                text:
                    widget.buttonText ??
                    AppLocalizations.of(context)!.add_event,
                onPressed: addEvent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (_formKey.currentState!.validate() &&
        selectedTime != null &&
        selectedDate != null) {
      if (widget.event == null) {
        Event event = Event(
          image: images[selectedIndex],
          title: eventNameController.text,
          description: eventDescController.text,
          eventName: eventListProvider.getEventTypesList[selectedIndex + 1],
          dateTime: selectedDate!,
          time: "${selectedTime!.hour}:${selectedTime!.minute}",
          // "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
        );
        FirebaseUtils.addEvent(event, myUserProvider.myUser!.id).then((value) {
          if (kDebugMode) {
            print("data added successfully");
          }
        });
      } else {
        widget.event?.image = images[selectedIndex];
        widget.event?.title = eventNameController.text;
        widget.event?.description = eventDescController.text;
        widget.event?.eventName =
            eventListProvider.getEventTypesList[selectedIndex + 1];
        widget.event?.dateTime = selectedDate!;
        widget.event?.time = "${selectedTime!.hour}:${selectedTime!.minute}";
        eventListProvider.editEvent(widget.event!, myUserProvider.myUser!.id);
        Navigator.pop(context);
      }

      eventListProvider.setFetchFalse();
      Navigator.pushNamed(context, RouteNames.homeScreen);
    }
  }

  String? titleValidator(String? txt) {
    if (txt == null || txt.trim().isEmpty) {
      return AppLocalizations.of(context)!.empty_field;
    }
    return null;
  }
}
