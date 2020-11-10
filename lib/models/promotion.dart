import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Promotion {
  String id;
  String title;
  String description;
  String url;
  String image;
  DateTime dateFrom;
  DateTime dateTo;

  DocumentReference reference;

  Promotion(this.id, this.title, this.description, this.url, this.dateFrom,
      {this.dateTo, this.image, this.reference});

  factory Promotion.fromJson(Map<dynamic, dynamic> json) =>
      _PromotionFromJson(json);


  Map<String, dynamic> toJson() => _PromotionToJson(this);

  factory Promotion.fromFirestore(DocumentSnapshot documentSnapshot) {
    Promotion promotion = Promotion.fromJson(documentSnapshot.data);
    return promotion;
  }

  @override
  String toString() => "Promotion<$title>";

}

Promotion _PromotionFromJson(Map<dynamic, dynamic> json) {
  return Promotion(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
      json['url'] as String,
      json['dateFrom'] == null ? null : (json['dateFrom'] as Timestamp).toDate(),
      image: json['image'] as String,
      dateTo: json['dateTo'] == null ? null : (json['dateTo'] as Timestamp).toDate());
}

//2
Map<String, dynamic> _PromotionToJson(Promotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'image': instance.image,
      'reference': instance.reference
    };
