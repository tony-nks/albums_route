import 'package:albums_route/artist_info.dart';
import 'package:flutter/material.dart';
import 'package:albums_route/artists_list.dart';
import 'package:albums_route/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            });
          case ArtistsList.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return ArtistsList();
            });
          case ArtistInfo.routeName:
            final arguments = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (BuildContext context) {
              if (arguments != null &&
                  arguments.containsKey('title') &&
                  arguments.containsKey('about')) {
                return ArtistInfo(
                  title: arguments['title'],
                  about: arguments['about'],
                );
              }
              return ArtistInfo();
            });
        }
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Routes'),
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
                    title: Text('Artists List'),
                    trailing: Icon(Icons.arrow_right_outlined),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/artists_list');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center());
  }
}
