import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/data/models/item_model.dart';
import 'package:flutter_structure_application/app/data/routes/routes.dart';
import 'package:get/get.dart';

class ItemTileWidget extends StatelessWidget {
  const ItemTileWidget({
    super.key,
    required this.item,
  });
  final ItemDefinition item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.category),
      leading: CircleAvatar(
        child: Text(
          item.amount.toString(),
        ),
      ),
      trailing: Text(item.dueDate),
      onTap: () => Get.toNamed(
        Routes.itemDetail,
        arguments: [item],
      ),
    );
  }
}
