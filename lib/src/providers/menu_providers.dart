import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opts = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final data = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(data);

    opts = dataMap["rutas"];

    return opts;
  }
}

final menuProvider = new _MenuProvider();
