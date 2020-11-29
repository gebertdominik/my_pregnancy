import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserSettings {
  String id;
  String firstName;
  String babyName;
  DateTime expectedDate;

  DocumentReference reference;

  UserSettings(this.id, this.firstName, this.babyName, this.expectedDate, {this.reference});

  factory UserSettings.fromJson(String id, Map<dynamic, dynamic> json) =>
      _userSettingsFromJson(id, json);

  Map<String, dynamic> toJson() => _userSettingsToJson(this);

  factory UserSettings.fromFirestore(DocumentSnapshot documentSnapshot) {
    UserSettings userSettings = UserSettings.fromJson(documentSnapshot.id, documentSnapshot.data());
    return userSettings;
  }

  @override
  String toString() => "UserSettings<$firstName>";
}

UserSettings _userSettingsFromJson(String id, Map<dynamic, dynamic> json) {
  return UserSettings(
      id,
      json['firstName'] as String,
      json['babyName'] as String,
      json['expectedDate'] == null
          ? null
          : (json['expectedDate'] as Timestamp).toDate());
}

Map<String, dynamic> _userSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'babyName': instance.babyName,
      'expectedDate': instance.expectedDate,
      'reference': instance.reference
    };
