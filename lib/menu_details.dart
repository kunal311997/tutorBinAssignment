import 'package:assignment2/repository/menu_repository.dart';
import 'package:flutter/material.dart';

import 'models/index.dart';

class MenuDetails with ChangeNotifier {
  List<Category> menuList = [];
  List<Item> addedItems = [];
  List<Item> placedItems = [];
  var _totalAmount = 0.0;
  late MenuRepository repository;

  MenuDetails() {
    repository = MenuRepository();
    _fetchMenu();
  }

  _fetchMenu() {
    var response = repository.fetchMenu();

    menuList = [
      Category(title: 'Category 1', items: response.cat1),
      Category(title: 'Category 2', items: response.cat2),
      Category(title: 'Category 3', items: response.cat3),
      Category(title: 'Category 4', items: response.cat4),
      Category(title: 'Category 5', items: response.cat5),
      Category(title: 'Category 6', items: response.cat6),
    ];
    if (placedItems.isNotEmpty) {
      for (var item in placedItems) {
        item.quantity = 0;
      }
      menuList.insert(
          0,
          Category(
              items: placedItems.length < 3
                  ? placedItems.sublist(0, placedItems.length)
                  : placedItems.sublist(0, 3),
              title: 'Popular items'));
    }
    notifyListeners();
  }

  void addItem(Item item) {
    if (addedItems.contains(item)) {
      item.quantity++;
    } else {
      addedItems.add(item);
      item.quantity++;
    }
    _totalAmount = 0;
    notifyListeners();
  }

  void removeItem(Item item) {
    item.quantity--;
    addedItems.remove(item);
    _totalAmount = 0;
    notifyListeners();
  }

  double get totalAmount {
    for (var item in addedItems) {
      _totalAmount = _totalAmount + (item.price ?? 0.0);
    }
    return _totalAmount;
  }

  void placeOrder() {
    placedItems.addAll(addedItems);
    placedItems.sort((Item b, Item a) => (a.quantity).compareTo(b.quantity));
    addedItems.clear();
    _totalAmount = 0;
    notifyListeners();
    resetMenu();
  }

  void resetMenu() {
    _fetchMenu();
  }
}
