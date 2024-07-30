import 'package:flutternew/models/catalog.dart';

class CartModel {
  // Private constructor
  CartModel._();

  // Singleton instance
  static final CartModel _instance = CartModel._();

  // Factory constructor to return the singleton instance
  factory CartModel() => _instance;

  // Catalog field
  late CatalogModel _catalog; // Ensure this is initialized before use

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => CatalogModel.getById(id)).toList();

  // Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add Item
  void add(Item item) {
    if (!_itemIds.contains(item.id)) {
      _itemIds.add(item.id);
    }
  }

  // Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
