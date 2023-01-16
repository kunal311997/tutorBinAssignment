import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../menu_details.dart';
import '../ui/index.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = ScrollController();
    var menuDetails = Provider.of<MenuDetails>(context);

    return Expanded(
      child: ListView.builder(
          controller: controller,
          itemCount: menuDetails.menuList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Category(
              category: menuDetails.menuList.elementAt(index),
              controller: controller,
            );
          }),
    );
  }
}
