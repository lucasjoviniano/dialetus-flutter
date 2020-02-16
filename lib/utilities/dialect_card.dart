import 'package:flutter/material.dart';

class DialectCard extends StatefulWidget {

  DialectCard({@required this.title, @required this.meaning, @required this.tap});

  final Function tap;
  final String title;
  final String meaning;
  @override
  _DialectCardState createState() => _DialectCardState();
}

class _DialectCardState extends State<DialectCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: widget.tap,
        child: ListTile(
          title: Text(widget.title),
          subtitle: Text('${widget.meaning}'),
          trailing: Icon(Icons.share),
          isThreeLine: true,
        )
      ),
    );
  }
}
