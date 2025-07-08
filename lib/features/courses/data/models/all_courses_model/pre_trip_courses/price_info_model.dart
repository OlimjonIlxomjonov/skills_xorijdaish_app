import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/price_info_entity.dart';

class PriceInfoModel extends PriceInfoEntity {
  PriceInfoModel({
    required super.price,
    required super.discount,
    required super.oldPrice,
    required super.discountExpiresAt,
  });

  factory PriceInfoModel.fromJson(Map<String, dynamic> json) {
    return PriceInfoModel(
      price: json['price'],
      discount: json['discount'],
      oldPrice: json['old_price'],
      discountExpiresAt: json['discount_expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'discount': discount,
      'old_price': oldPrice,
      'discount_expires_at': discountExpiresAt,
    };
  }
}
