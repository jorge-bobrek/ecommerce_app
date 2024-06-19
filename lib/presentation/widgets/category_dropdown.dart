import 'package:fake_store_api_package/domain/utils/category_enum.dart';
import 'package:flutter/material.dart';

/// A widget that displays a dropdown menu for selecting a product category.
///
/// The [CategoryDropdownWidget] allows the user to select a category from a
/// predefined list of categories. It displays the selected category and notifies
/// the parent widget when the selection changes.
class CategoryDropdownWidget extends StatelessWidget {
  /// Creates an instance of [CategoryDropdownWidget].
  ///
  /// Both [selectedCategory] and [onChanged] are required.
  const CategoryDropdownWidget({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  /// The currently selected category.
  final Category? selectedCategory;

  /// Called when the user selects a different category.
  final ValueChanged<Category?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Category>(
          value: selectedCategory,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          onChanged: onChanged,
          items: Category.values
              .map<DropdownMenuItem<Category>>((Category category) {
            return DropdownMenuItem<Category>(
              value: category,
              child: Text(category.displayName),
            );
          }).toList(),
        ),
      ),
    );
  }
}
