import 'package:fake_store_api_package/domain/utils/category_enum.dart';
import 'package:fake_store_widgets_package/data/models/product_item_model.dart';
import 'package:fake_store_api_package/domain/entities/product_entity.dart';

/// A mapper class for converting [ProductEntity] to [ProductItemModel].
///
/// The [ProductMapper] class provides a method to transform a [ProductEntity]
/// into a [ProductItemModel] which is used in the presentation layer.
class ProductMapper {
  /// Converts a [ProductEntity] to a [ProductItemModel].
  ///
  /// The [toModel] method takes a [ProductEntity] object and returns a
  /// [ProductItemModel] with the same data.
  static ProductItemModel toModel(ProductEntity product) {
    return ProductItemModel(
      id: product.id,
      title: product.title,
      price: product.price,
      image: product.image,
      description: product.description,
      category: product.category?.displayName,
      rating: RatingItemModel(
          rate: product.rating?.rate, count: product.rating?.count),
    );
  }
}
