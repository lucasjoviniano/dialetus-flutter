import 'package:dialetus/utilities/dialect_card.dart';
import 'package:flutter/material.dart';
import 'package:dialetus/utilities/region_class.dart';

class RegionScreen extends StatefulWidget {
  RegionScreen({@required this.region});

  final Region region;

  @override
  _RegionScreenState createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  var dd;
  List<Widget> dialects = [];

  @override
  void initState() {
    super.initState();
    dd = widget.region.dialects;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dd,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _buildDialects(snapshot.data);
            return Scaffold(
              appBar: AppBar(
                title: Hero(tag: 'title_${widget.region.name}', child: Text(widget.region.displayName.toUpperCase(),),),
              ),
              body: ListView(
                children: dialects,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void _buildDialects(var data) {
    for (var i in data) {
      dialects.add(DialectCard(
          title: i['dialect'],
          meaning: _getMeanings(i),
          tap: () {
            print('tapped');
          }));
    }
  }

  String _getMeanings(var dialect) {
    if (dialect['meanings'].length == 1) {
      return dialect['meanings'].first;
    }

    String meanings = '${dialect['meanings'].first}, ';
    for (var i in dialect['meanings']) {
      if (i == dialect['meanings'].first || i == dialect['meanings'].last) {
        continue;
      } else {
        meanings += '$i, ';
      }
    }
    meanings += dialect['meanings'].last;

    return meanings;
  }
}
