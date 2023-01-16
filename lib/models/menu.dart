import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  List<Item> cat1;
  List<Item> cat2;
  List<Item> cat3;
  List<Item> cat4;
  List<Item> cat5;
  List<Item> cat6;

  Menu({
    required this.cat1,
    required this.cat2,
    required this.cat3,
    required this.cat4,
    required this.cat5,
    required this.cat6,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}


