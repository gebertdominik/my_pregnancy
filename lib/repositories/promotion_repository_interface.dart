import 'package:my_pregnancy/models/promotion.dart';

abstract class IPromotionRepository {
  Future<List<Promotion>> getAllPromotions();
}
