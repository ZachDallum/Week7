import 'package:flutter/material.dart';
import '../Models/globalItems.dart';
import '../Models/item.dart';

class EditItemPage extends StatefulWidget {
  final Item item;

  const EditItemPage({Key? key, required this.item}) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState(item);
}

class _EditItemPageState extends State<EditItemPage> {
  _EditItemPageState(item);

  late Item item = widget.item;

  TextEditingController itemNameContoller = new TextEditingController();
  TextEditingController itemDescriptionController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    itemNameContoller.text = item.name;
    itemDescriptionController.text = item.description;
  }

  void _updateItemPressed() {
    Item currentItem =
        GlobalItems().items.firstWhere((index) => index.id == item.id);
    currentItem.name = itemNameContoller.text;
    currentItem.description = itemDescriptionController.text;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Edit Item Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: itemNameContoller,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: itemDescriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              ElevatedButton(
                onPressed: _updateItemPressed,
                child: Text("Update Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
