import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? name;
  num? price;
  bool? instock;
  @JsonKey(ignore: true)
  int quantity = 0;

  Item({this.name, this.price, this.instock});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}