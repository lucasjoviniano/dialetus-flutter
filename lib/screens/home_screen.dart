import 'package:dialetus/screens/region_screen.dart';
import 'package:dialetus/utilities/region_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var decodedRegions;

  @override
  void initState() {
    super.initState();
    decodedRegions = RegionHelper.buildRegions();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> l = [];

    void _buildCards(var decoded) {
      for (var i in decoded) {
        l.add(
          Card(
            child: InkWell(
              child: ListTile(
                title: Text(
                  i.displayName,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${i.amount} dialetos'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegionScreen(region: i),
                  ),
                );
              },
            ),
          ),
        );
      }
    }

    return FutureBuilder(
        future: decodedRegions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _buildCards(snapshot.data);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'DIALETUS',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              body: ListView(
                children: l,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
