import 'package:fake_store_api_package/domain/entities/product_entity.dart';
import 'package:fake_store_api_package/domain/utils/category_enum.dart';
import 'package:fake_store_api_package/catalog.dart';
import 'package:flutter/material.dart';

/// A provider for managing the product catalog and state.
///
/// The [ProductProvider] handles fetching products, filtering them, and managing
/// the selected product and category. It notifies listeners when the state changes.
class ProductProvider with ChangeNotifier {
  /// The catalog to fetch products from.
  final Catalog catalog;

  /// The list of all products.
  List<ProductEntity> products = [];

  /// The list of products filtered by a query or category.
  List<ProductEntity> filteredProducts = [];

  /// The currently selected product.
  ProductEntity? selectedProduct;

  /// The currently selected category for filtering products.
  Category selectedCategory = Category.none;

  /// An error message, if any error occurs while fetching products.
  String? errorMessage;

  /// Creates an instance of [ProductProvider].
  ProductProvider({required this.catalog});

  /// Fetches the list of all products from the catalog.
  ///
  /// Notifies listeners when the products are successfully fetched or if an error occurs.
  Future<void> fetchProducts() async {
    products = [];
    final result = await catalog.getProductsList();
    result.fold(
      (productList) {
        products = productList;
        filteredProducts = productList;
        notifyListeners();
      },
      (failure) {
        errorMessage = 'Error al cargar los productos';
        notifyListeners();
      },
    );
  }

  /// Fetches a product by its [id] from the catalog.
  ///
  /// Notifies listeners when the product is successfully fetched or if an error occurs.
  Future<void> fetchProduct(int id) async {
    selectedProduct = null;
    final result = await catalog.getProduct(id);
    result.fold(
      (product) {
        selectedProduct = product;
        notifyListeners();
      },
      (failure) {
        errorMessage = 'Error al cargar el producto';
        notifyListeners();
      },
    );
  }

  /// Fetches products in the specified [category] from the catalog.
  ///
  /// Notifies listeners when the products are successfully fetched or if an error occurs.
  Future<void> fetchProductsInCategory(Category category) async {
    filteredProducts = [];
    selectedCategory = category;
    notifyListeners();

    if (category == Category.none) {
      fetchProducts();
    } else {
      final result = await catalog.getProductsInCategory(category);
      result.fold(
        (productList) {
          filteredProducts = productList;
          notifyListeners();
        },
        (failure) {
          errorMessage = 'Error al cargar los productos en la categoría';
          notifyListeners();
        },
      );
    }
  }

  /// Filters the products by a search [query].
  ///
  /// Notifies listeners when the filtered products list is updated.
  void filterProducts(String query) {
    filteredProducts = products
        .where((element) =>
            element.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
