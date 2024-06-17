import 'package:ecommerce_app/domain/entities/cart_item_entity.dart';
import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

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

  void clearProduct(ProductEntity product) {
    final index =
        _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.product.price! * item.quantity));
  }
}
