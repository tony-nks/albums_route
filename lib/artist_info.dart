import 'package:flutter/material.dart';

class ArtistInfo extends StatefulWidget {
  static const routeName = '/artist_info';
  ArtistInfo({Key key, this.title, this.about}) : super(key: key);
  final String title;
  final String about;

  @override
  State<ArtistInfo> createState() => _ArtistInfoState();
}

class _ArtistInfoState extends State<ArtistInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(widget.about),
          )),
    );
  }
}
