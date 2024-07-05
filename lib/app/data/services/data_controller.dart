import 'package:flutter_structure_application/app/data/models/item_model.dart';
import 'package:flutter_structure_application/app/data/providers/db_provider.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadItemsFromDb();
  }

  final RxList<ItemDefinition> _itemList = <ItemDefinition>[].obs;
  List<ItemDefinition> get itemList => _itemList;

  void setItemList(List<ItemDefinition> items) {
    _itemList.assignAll(items);
    update();
  }

  Future<void> updateItem(ItemDefinition item) async {
    //TODO:
    // final result = await DbProvider.db.updateItem(item); // update in db
    // loadItemsFromDb(); // update controller data
  }

  Future<void> deleteItem(int id) async {
    //TODO:
    // final result = await DbProvider.db.deleteItem(id); // update in db
    // loadItemsFromDb(); // update controller data
  }

  Future<void> addItem(ItemDefinition item) async {
    //TODO:
    // add to db
    // loadItemsFromDb(); // update controller data
  }

  Future<void> loadItemsFromDb() async {
    final result = await DbProvider.db.getItems();
    setItemList(result);
  }
}
