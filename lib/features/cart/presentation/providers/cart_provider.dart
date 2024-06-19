import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

/// A provider for managing the shopping cart state.
///
/// The [CartProvider] handles adding, removing, and clearing products in the cart.
/// It also provides the total price of the items in the cart and notifies listeners
/// when the cart state changes.
class CartProvider with ChangeNotifier {
  /// The list of items in the cart.
  final List<CartItem> _cartItems = [];

  /// Gets the list of items in the cart.
  List<CartItem> get cartItems => _cartItems;

  /// Adds a product to the cart.
  ///
  /// If the product is already in the cart, increases its quantity by one.
  /// Otherwise, adds a new [CartItem] to the cart.
  void addProduct(ProductEntity product) {
    final index =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  /// Removes a product from the cart.
  ///
  /// If the product's quantity is greater than one, decreases its quantity by one.
  /// Otherwise, removes the [CartItem] from the cart.
  void removeProduct(ProductEntity product) {
    final index =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
    }
    notifyListeners();
  }

  /// Clears a specific product from the cart.
  ///
  /// Removes the [CartItem] associated with the given product from the cart.
  void clearProduct(ProductEntity product) {
    final index =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  /// Clears all products from the cart.
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  /// Gets the total price of all items in the cart.
  double get totalPrice {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.product.price! * item.quantity));
  }
}
