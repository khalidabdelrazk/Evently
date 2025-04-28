import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/providers/change_lang.dart';
import 'package:flutter/material.dart';

import '../../firebase/firebase_utils.dart';
import '../model/event.dart';

class EventListProvider extends ChangeNotifier{
  late List<Event> _eventList = [];
  late List<Event> _favEventList = [];


  List<Event> get getEventList => _eventList;
  List<Event> get getFavEventList => _favEventList;

  void getAllEvent() async {
    QuerySnapshot<Event> querySnapshot =
    await FirebaseUtils.getEventCollection().get();
    _eventList =
        querySnapshot.docs.map((e) {
          return e.data();
        }).toList();
    notifyListeners();
  }

  void getFavEvent() async {
    QuerySnapshot<Event> querySnapshot =
    await FirebaseUtils.getEventCollection().get();
    _eventList =
        querySnapshot.docs.where((element) => element.data().isFavourite,).map((e){
          return e.data();
        }).toList();
    notifyListeners();
  }
}