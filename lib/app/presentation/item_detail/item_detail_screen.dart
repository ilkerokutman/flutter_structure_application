import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/data/models/item_model.dart';
import 'package:get/get.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemDefinition item = Get.arguments[0] as ItemDefinition;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
    );
  }
}
