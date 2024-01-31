import 'package:flutter/material.dart';
import 'package:lab2/models/clothing.dart';
import 'package:lab2/widgets/add_new_clothing_widget.dart';
import 'package:lab2/widgets/edit_clothing_widget.dart';

class ClothesList extends StatefulWidget {
  const ClothesList({super.key});

  @override
  State<ClothesList> createState() => _ClothesListState();
}

class _ClothesListState extends State<ClothesList> {
  List<Clothing> clothes = [];

  void addNewClothing(Clothing clothing) {
    setState(() {
      clothes.add(clothing);
    });
  }

  void editClothing(int index, Clothing clothing) {
    if (index >= 0 && index < clothes.length) {
      setState(() {
        clothes[index] = clothing;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Clothes list"),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: AddNewClothing(
                          addNewClothing: addNewClothing,
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.add_circle_outline_rounded,
                  color: Colors.white),
            )
          ]),
      body: ListView.builder(
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  "${clothes[index].title} \$${clothes[index].price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.blue),
                ),
                Text(
                  clothes[index].description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            clothes.removeAt(index);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {},
                                  child: EditClothing(
                                    index: index,
                                    clothing: clothes[index],
                                    editClothing: editClothing,
                                  ),
                                );
                              });
                        },
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
