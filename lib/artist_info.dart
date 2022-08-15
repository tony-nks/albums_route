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
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  trailing: Icon(Icons.arrow_right_outlined),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home_page');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.family_restroom),
                  title: Text('Artists List'),
                  trailing: Icon(Icons.arrow_right_outlined),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil(('/artists_list'), (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
