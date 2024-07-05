import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/core/constants/dimens.dart';
import 'package:flutter_structure_application/app/data/models/item_model.dart';
import 'package:flutter_structure_application/app/data/services/data_controller.dart';
import 'package:get/get.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final DataController dataController = Get.find();
  late ItemDefinition newItem;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    newItem = ItemDefinition(
      id: 0,
      name: '',
      description: '',
      amount: 0,
      dueDate: DateTime.now().toString(),
      category: '',
      status: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: SingleChildScrollView(
        padding: UiDimens.horizontalPadding,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add Item'),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(),
                ),
                onSaved: (newValue) {
                  setState(() {
                    newItem.name = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Description'),
                  border: OutlineInputBorder(),
                ),
                onSaved: (newValue) {
                  setState(() {
                    newItem.description = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              const Text(' .... add other fields here ....'),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print('validation error');
                    }
                    return;
                  }
                  formKey.currentState!.save(); // <-- Calls onSaved
                  await dataController
                      .addItem(newItem); // <-- Calls addItem, this updates list
                  Get.back(); // <-- Closes screen, get back to list
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
