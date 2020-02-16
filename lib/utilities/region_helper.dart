import 'dart:convert';

import 'package:dialetus/utilities/constants.dart';
import 'package:dialetus/utilities/region_class.dart';
import 'package:http/http.dart' as http;

class RegionHelper {
  static dynamic buildRegions() async {
    List regions = [];
    var regionsDecoded = await _getRegions();

    for (var i in regionsDecoded) {
      var region = Region(name: i['name'], amount: i['total']);
      await region.init();
      regions.add(region);
    }

    return regions;
  }

  static dynamic _getRegions() async {
    http.Response response = await http.get('$kBaseURL/regions');

    return jsonDecode(response.body);
  }
}
