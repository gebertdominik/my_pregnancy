import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pregnancy/models/promotion.dart';
import 'package:my_pregnancy/repositories/promotion_repository_interface.dart';

class PromotionRepository implements IPromotionRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('promotions');

  Future<List<Promotion>> getAllPromotions() async {
    QuerySnapshot query = await collection.get();
    List<Promotion> promotions =
        query.docs.map((doc) => Promotion.fromFirestore(doc)).toList();
    return promotions;
  }
}
