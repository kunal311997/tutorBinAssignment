import 'package:assignment2/menu_details.dart';
import 'package:assignment2/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/index.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MenuDetails(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.appName),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MenuList(),
              PlaceOrderButton(),
            ],
          )),
    );
  }
}
