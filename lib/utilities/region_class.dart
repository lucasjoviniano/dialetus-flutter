import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dialetus/utilities/constants.dart';

class Region {
  Region({this.name, this.amount}) {
    displayName = name.replaceFirst(name[0], name[0].toUpperCase());
  }

  Future init() async {
    dialects = _getDialects();
  }

  String name;
  String displayName;
  int amount;
  var dialects;

  dynamic _getDialects() async {
    http.Response dialectPage =
        await http.get('$kBaseURL/regions/$name/dialects');

    return jsonDecode(dialectPage.body);
  }

}
