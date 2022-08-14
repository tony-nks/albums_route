import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:albums_route/fetch_file.dart';

class ArtistsList extends StatefulWidget {
  static const routeName = '/artists_list';
  const ArtistsList({Key key}) : super(key: key);

  @override
  State<ArtistsList> createState() => _ArtistsListState();
}

class _ArtistsListState extends State<ArtistsList> {
  List<dynamic> data;

  Future loadJson() async {
    var json = await fetchFileFromAssets('assets/artists.json');
    setState(() => data = jsonDecode(json));
  }

  @override
  void initState() {
    super.initState();
    this.loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists List'),
      ),
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
                  title: Text(
                    'Artists List',
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => (ListTile(
                title: Text('${data[index]["name"]}'),
                onTap: () {
                  Navigator.of(context).pushNamed('/artist_info', arguments: {
                    'title': data[index]["name"].toString(),
                    'about': data[index]["about"].toString()
                  });
                },
              ))),
    );
  }
}
