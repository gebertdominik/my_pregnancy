
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pregnancy/models/promotion.dart';

class PromotionRepository {

  final CollectionReference collection = Firestore.instance.collection('promotions');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addPet(Promotion promotion) {
    return collection.add(promotion.toJson());
  }

  updatePromotion(Promotion promotion) async {
    await collection.document(promotion.reference.documentID).updateData(promotion.toJson());
  }
}