import 'package:evently/core/model/event.dart';

class MyUser {
  static final String collectionName = 'MyUserCollection';
  final String id;
  final String name;
  final String email;

  MyUser({required this.id, required this.name, required this.email});

  // Todo: from firebase
  MyUser.toObject(Map<String, dynamic> data)
    : this(email: data['email'], id: data['id'], name: data['name']);

  // Todo: to firebase
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name};
  }
}
