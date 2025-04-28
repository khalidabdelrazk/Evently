import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore:
              (snapshot, options) => Event.toObject(snapshot.data()!),
          toFirestore: (event, setOptions) => event.toJson(),
        );
  }
  static Future<void> addEvent(Event event){
    var eventCollection = getEventCollection();
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }
}
