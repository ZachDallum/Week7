import 'package:flutter/material.dart';
import 'Models/item.dart';
import 'Models/globalItems.dart';
import 'Views/editItemPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dallum Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Item item = Item(1, "h", "t");

  void _handleButtonPress(Item selectedItem) {
    setState(() {
      if (!GlobalItems().items.contains(selectedItem)) {
        GlobalItems().items.add(selectedItem);
      }
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditItemPage(item: selectedItem)),
      ).then((value) {
        setState(() {
          item = GlobalItems()
              .items
              .firstWhere((index) => index.id == selectedItem.id);
        });
      });
    });
  }

  void _handleDelete(Item selectedItem) {
    setState(() {
      GlobalItems().items.remove(selectedItem);
      if (item.id == selectedItem.id) {
        item = Item(0, '', '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Inventory Items',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: GlobalItems().items.length,
              itemBuilder: (context, index) {
                final currentItem = GlobalItems().items[index];
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Item ID: ${currentItem.id}'),
                      subtitle: Text(
                          'Item Name: ${currentItem.name}\nItem Description: ${currentItem.description}'),
                      onTap: () {
                        _handleButtonPress(currentItem);
                      },
                      trailing: ElevatedButton(
                        onPressed: () {
                          _handleDelete(currentItem);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white,
                        ),
                        child: Text('Delete'),
                      ),
                    ),
                    if (index != GlobalItems().items.length - 1) Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
