import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future<void> addNewUser(String name) async {
    bool exists = false;
    await userCollection.document(uid).get().then((doc) {
      if(doc.exists)
        exists = true;
      else
        exists = false;
    });
    if(!exists) {
      return await userCollection.document(uid).setData({
        'name': name,
      });
    }
  }

  Future<void> addUserFB(String age, String yogaDays, String yogaTime, String yogaPrac, String medTime, String medProb) async {
    return await userCollection.document(uid).updateData({
      'Age': age,
      'YogaDays': yogaDays,
      'YogaTime': yogaTime,
      'YogaPrac': yogaPrac,
      'MedTime': medTime,
      'MedProb': medProb
    });
  }

}