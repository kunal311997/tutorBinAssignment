import 'package:flutter/material.dart';
import '../models/index.dart' as cm;
import '../ui/index.dart';

class Category extends StatelessWidget {
  final cm.Category category;
  final ScrollController? controller;

  const Category({Key? key, required this.category, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category.title),
            Text(category.items.length.toString())
          ],
        ),
        children: [
          ListView.separated(
            controller: controller,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int i) {
              return Container(height: 1.0, color: Colors.amber);
            },
            itemBuilder: (BuildContext context, int i) {
              return Item(item: category.items.elementAt(i));
            },
            itemCount: category.items.length,
          )
        ]);
  }
}
