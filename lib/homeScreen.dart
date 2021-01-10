import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:universal_html/html.dart' as html;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                var data = {
                  "title": "Any title",
                  "text": "Hello blallala blalal"
                };
                share(data);
              },
              child: Container(
                child: Text('Share text'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                var data = {
                  "title": "Any title",
                  "text": "Hello blallala blalal",
                  "url":"http://friano.me"
                };
                share(data);
              },
              child: Container(
                child: Text('share text with url'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () async {
                var imageUrl =
                    'https://th.bing.com/th/id/OIP.9vDMAbazJw-xBWTAQ0sdDgHaFj?pid=Api&rs=1';
                final bytes = await readBytes(imageUrl);
                var file = [html.File([bytes],"imagename.jpg",{"type":"image/jpeg"})];
                var data = {
                  "title": "Any title",
                  "text": "Hello blallala blalal",
                  "url":"http://friano.me",
                  "files":file
                };
                share(data);
              },
              child: Container(
                child: Text('share text with url and image'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void share(Map data) async {
    try {
      await html.window.navigator.share(data);
      print('done');
    } catch (e) {
      print(e);
    }
  }
}
