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
      child: RaisedButton(
        onPressed: onPressed,
        child: Container(
          child: Text('share'),
        ),
      ),
    ));
  }

  void onPressed() async {
     var byte = await readBytes('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Hazy_Crazy_Sunrise.jpg/800px-Hazy_Crazy_Sunrise.jpg');
    try {
      var file = html.File([byte], "image.jpg", {"type": "image/jpeg"});
      await html.window.navigator.share({
        "title": "PWA Share",
        "text": "Hello this is test run...",
        "url": "http://friano.me/",
        "files":[file]
      });
      print('done');
    } catch (e) {
      print(e);
    }
  }
}
