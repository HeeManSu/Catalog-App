import 'package:catalog_app/models/catalog.dart';

class CartModel {

//We are making  it singleton so that its object only once created.
  static final cartModel = CartModel._internal();

  //Constructor
  CartModel._internal();

  factory CartModel() => cartModel;

  //Catalog Field.
  late CatalogModel _catalog;

//Colletion of IDs - store Ids of each item.
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

//Set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get items by their id in the cart.

  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  //Get the total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
