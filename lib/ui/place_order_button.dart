import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../menu_details.dart';
import '../utils/extensions.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuDetails = Provider.of<MenuDetails>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => menuDetails.placeOrder(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 1.0),
                const Text(Strings.placeOrder),
                Text('\$ ${menuDetails.totalAmount.toString()}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
