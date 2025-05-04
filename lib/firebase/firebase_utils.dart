import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/model/event.dart';
import 'package:evently/core/model/my_user.dart';

class FirebaseUtils {
  // todo: event
  static CollectionReference<Event> getEventCollection(String uId) {
    return getUserCollection().doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore:
              (snapshot, options) => Event.toObject(snapshot.data()!),
          toFirestore: (event, setOptions) => event.toJson(),
        );
  }

  static Future<void> addEvent(Event event,String uId) {
    var eventCollection = getEventCollection(uId);
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

  // todo: user
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter(
          fromFirestore:
              (snapshot, _) => MyUser.toObject(snapshot.data() ?? {}),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        );
  }

  static Future<void> addUser(MyUser myUser){
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFirestore(String id) async{
    DocumentSnapshot<MyUser> querySnapshot = await getUserCollection().doc(id).get();
    return querySnapshot.data();
  }


}
