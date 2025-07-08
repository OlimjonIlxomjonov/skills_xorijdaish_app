class PriceInfoEntity {
  final int price;
  final int discount;
  final int oldPrice;
  final String? discountExpiresAt;

  PriceInfoEntity({
    required this.price,
    required this.discount,
    required this.oldPrice,
    required this.discountExpiresAt,
  });


}
