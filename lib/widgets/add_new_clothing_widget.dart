import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab2/models/clothing.dart';

class AddNewClothing extends StatefulWidget {
  final Function addNewClothing;

  const AddNewClothing({super.key, required this.addNewClothing});

  @override
  State<AddNewClothing> createState() => _AddNewClothingState();
}

class _AddNewClothingState extends State<AddNewClothing> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  void submit() {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty) {
      return;
    }
    widget.addNewClothing(Clothing(Random().nextInt(15), _titleController.text,
        _descriptionController.text, double.parse(_priceController.text)));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Add title"),
              controller: _titleController,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(labelText: "Add description"),
              controller: _descriptionController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Add price"),
              controller: _priceController,
            ),
            ElevatedButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[100],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () => submit(),
                child: const Text(
                  "Add",
                ))
          ],
        ));
  }
}
