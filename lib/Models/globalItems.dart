import 'item.dart';

class GlobalItems {
  static final GlobalItems _item = GlobalItems._instance();

  factory GlobalItems() {
    return _item;
  }

  GlobalItems._instance();

  List<Item> items = [
    Item(001, 'Doritos', 'Potato Chip'),
    Item(002, 'Cheetos', 'Potato Chip'),
    Item(003, 'Lucky Charms', 'Cereal'),
    Item(004, 'Milk', 'Dairy Item'),
    Item(005, 'Bread', 'Grain'),
    Item(006, 'Steaks', 'Meat'),
    Item(007, 'Chicken Breast', 'Meat'),
    Item(008, 'Ice Cream', 'Dairy Item'),
    Item(009, 'Donuts', 'Grain'),
    Item(010, 'Apple', 'Fruit'),
  ];
}
