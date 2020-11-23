import 'package:my_pregnancy/models/promotion.dart';
import 'package:my_pregnancy/repositories/promotion_repository.dart';
import 'package:my_pregnancy/repositories/promotion_repository_interface.dart';

class PromotionsController {
  final IPromotionRepository _promotionRepository = PromotionRepository();

  Future<List<Promotion>> getAllPromotions() {
    return _promotionRepository.getAllPromotions();
  }
}
