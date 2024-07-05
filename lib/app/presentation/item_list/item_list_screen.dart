import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/core/constants/strings.dart';
import 'package:flutter_structure_application/app/data/routes/routes.dart';
import 'package:flutter_structure_application/app/data/services/data_controller.dart';
import 'package:flutter_structure_application/app/presentation/components/bottom_bar.dart';
import 'package:flutter_structure_application/app/presentation/item_list/item_tile_widget.dart';
import 'package:get/get.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item list'),
      ),
      bottomNavigationBar: const MyBottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addItem);
        },
        heroTag: 'add',
        tooltip: UiStrings.addItem,
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<DataController>(
        builder: (data) => ListView.builder(
          itemCount: data.itemList.length,
          itemBuilder: (context, index) => ItemTileWidget(
            item: data.itemList[index],
          ),
        ),
      ),
    );
  }
}
