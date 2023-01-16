import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../menu_details.dart';
import '../models/index.dart' as cm;
import '../utils/extensions.dart';

class Item extends StatelessWidget {
  final cm.Item item;

  const Item({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuDetails = Provider.of<MenuDetails>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(item.name ?? ''),
                Text('\$ ${item.price?.toDouble().toString()}'),
              ],
            ),
          ),
          item.quantity == 0
              ? OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    ),
                    side: MaterialStateProperty.all(
                        const BorderSide(width: 1.0, color: Colors.orange)),
                  ),
                  onPressed: () => menuDetails.addItem(item),
                  child: const Text(Strings.add))
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => menuDetails.removeItem(item),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 4.0, right: 15),
                            child: Text(
                              Strings.minusSymbol,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(item.quantity.toString()),
                        GestureDetector(
                          onTap: () => menuDetails.addItem(item),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 4.0, left: 15),
                            child: Text(
                              Strings.plusSymbol,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
