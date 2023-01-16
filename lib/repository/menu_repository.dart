import 'dart:convert';

import '../models/index.dart';

class MenuRepository {
  Menu fetchMenu() => Menu.fromJson(json.decode(dummyJson));
}
