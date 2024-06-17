import 'package:fake_store_widgets_package/data/models/product_item_model.dart';
import 'package:fake_store_api_package/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductItemModel toModel(ProductEntity product) {
    return ProductItemModel(
      id: product.id,
      title: product.title,
      price: product.price,
      image: product.image,
      description: product.description,
      category: product.category?.name,
      rating: RatingItemModel(
          rate: product.rating?.rate, count: product.rating?.count),
    );
  }
}
