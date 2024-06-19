import 'package:fake_store_api_package/domain/entities/product_entity.dart';

/// Represents an item in the shopping cart.
///
/// The [CartItem] class includes the product and its quantity.
class CartItem {
  /// The product associated with this cart item.
  final ProductEntity product;

  /// The quantity of the product in the cart.
  int quantity;

  /// Creates an instance of [CartItem].
  ///
  /// The [product] parameter is required. The [quantity] defaults to 1.
  CartItem({required this.product, this.quantity = 1});
}
