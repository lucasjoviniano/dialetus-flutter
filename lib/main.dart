import 'package:dialetus/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Dialetus());

class Dialetus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        fontFamily: 'IBMPlexSans'
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:dialetus/utilities/constants.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   getRegions();
// }

// dynamic getRegions() async {
//   http.Response response = await http.get('$kBaseURL/regions');

//   var decoded = jsonDecode(response.body);

//   for (var i in decoded) {
//     print(i['name'].replaceFirst(i['name'][0], i['name'][0].toUpperCase()));
//     var dialects = await getDialects(i['name']);
//     for (var j in dialects) {
//       print(getMeanings(j));
//     }
//   }
// }

// dynamic getDialects(String name) async {
//   http.Response dialectPage =
//       await http.get('$kBaseURL/regions/$name/dialects');

//   return jsonDecode(dialectPage.body);
// }

// String getMeanings(var dialect) {
//   if (dialect['meanings'].length == 1) {
//     return dialect['meanings'].first;
//   }

//   String meanings = '${dialect['meanings'].first}, ';
//   for (var i in dialect['meanings']) {
//     if (i == dialect['meanings'].first || i == dialect['meanings'].last) {
//       continue;
//     } else {
//       meanings += '$i, ';
//     }
//   }
//   meanings += dialect['meanings'].last;

//   return meanings;
// }
