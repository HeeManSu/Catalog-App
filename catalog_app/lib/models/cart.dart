import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

class AddMutaion extends VxMutation<MyStore> {
  final Item item;

  AddMutaion(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
