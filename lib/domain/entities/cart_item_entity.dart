import 'package:fake_store_api_package/domain/entities/product_entity.dart';

class CartItem {
  final ProductEntity product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
