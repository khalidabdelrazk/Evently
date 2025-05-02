import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../firebase/firebase_utils.dart';
import '../model/event.dart';
import 'package:evently/src/generated/i18n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  late List<Event> _eventList = [];
  late List<Event> _favEventList = [];
  late List<String> _eventTypesList = [];
  int _selectedIndex = 0;
  bool _hasFetchedEvents = false;

  List<Event> get getEventList => _eventList;
  List<Event> get getFavEventList => _favEventList;
  List<String> get getEventTypesList => _eventTypesList;
  int get getSelectedIndex => _selectedIndex;
  bool get hasFetchedEvents => _hasFetchedEvents;

  void setFalse() {
    _hasFetchedEvents = false;
    notifyListeners();
  }

  void getAllEvent() async {
    if (_hasFetchedEvents) return;

    _selectedIndex != 0 ? await _getFilteredEvents() : await _getAllEvents();
    _hasFetchedEvents = true;
    notifyListeners();
  }

  void getFavEvent() async {
    await _getFavItem();
    if (_favEventList.isNotEmpty) {
      notifyListeners();
    }
    _hasFetchedEvents = false;
  }

  void toggleFav(Event event) async {
    FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update({"isFavourite": !event.isFavourite})
        .timeout(
          const Duration(milliseconds: 500),
          onTimeout: () {
            print("Data updated successfully");
          },
        );
    _hasFetchedEvents = false;
    getAllEvent();
    await _getFavItem();
    _hasFetchedEvents = false;
    notifyListeners();
  }

  void editEvent(Event event) async {
    FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update({
          "image": event.image,
          "title": event.title,
          "description": event.description,
          "eventName": event.eventName,
          "dateTime": event.dateTime.millisecondsSinceEpoch,
          "time": event.time,
        })
        .timeout(
          const Duration(milliseconds: 500),
          onTimeout: () {
            print("Data updated successfully");
          },
        );
    _hasFetchedEvents = false;
    getAllEvent();
    _hasFetchedEvents = false;
    notifyListeners();
  }

  Future<void> _getAllEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().orderBy('dateTime').get();
    _eventList = querySnapshot.docs.map((e) => e.data()).toList();
  }

  Future<void> _getFavItem() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().orderBy('dateTime').get();
    _favEventList =
        querySnapshot.docs
            .where((element) => element.data().isFavourite)
            .map((e) => e.data())
            .toList();
  }

  Future<void> _getFilteredEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().orderBy('dateTime').get();
    _eventList =
        querySnapshot.docs
            .where(
              (element) =>
                  element.data().eventName == _eventTypesList[_selectedIndex],
            )
            .map((e) => e.data())
            .toList();
  }

  List<String> initEventTypesList() {
    return _eventTypesList = [
      'All',
      'Sport',
      'BirthDay',
      'Meeting',
      'Gaming',
      'Workshop',
      'Book Club',
      'Exhibition',
      'Holiday',
      'Eating',
    ];
  }

  void changeSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    _hasFetchedEvents = false;
    notifyListeners();
  }

  void deleteAllEvents() async {
    final snapshot = await FirebaseUtils.getEventCollection().get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    _eventList.clear();
    _favEventList.clear();
    _hasFetchedEvents = false;
    notifyListeners();
  }
}
