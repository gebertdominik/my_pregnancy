import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pregnancy/models/user_settings.dart';

class UserSettingsRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('userSettings');

  Future<UserSettings> getUserSettings(String userId) async {
    DocumentSnapshot documentSnapshot = await collection.doc(userId).get();
    UserSettings userSettings = UserSettings.fromFirestore(documentSnapshot);
    return userSettings;
  }

  Future<void> updateUserSettings(UserSettings userSettings) async {
    return collection
        .doc(userSettings.id)
        .set(userSettings.toJson(), SetOptions(merge: true));
  }
}
