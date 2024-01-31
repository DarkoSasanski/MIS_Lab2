import 'package:flutter/material.dart';
import 'package:lab2/models/clothing.dart';

class EditClothing extends StatefulWidget {
  final int index;
  final Clothing clothing;
  final Function editClothing;

  const EditClothing(
      {super.key,
      required this.index,
      required this.clothing,
      required this.editClothing});

  @override
  State<EditClothing> createState() => _EditClothingState();
}

class _EditClothingState extends State<EditClothing> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.clothing.title);
    _descriptionController =
        TextEditingController(text: widget.clothing.description);
    _priceController =
        TextEditingController(text: widget.clothing.price.toString());
  }

  void submit() {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty) {
      return;
    }
    widget.editClothing(
        widget.index,
        Clothing(widget.clothing.id, _titleController.text,
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
                  "Submit",
                ))
          ],
        ));
  }
}
