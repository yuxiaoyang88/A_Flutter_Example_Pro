import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_demo/body_section.dart';
import 'package:flutter_demo_pro/com/yu/bean/video.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  List<Widget> _gridViewBuilder(int length) {
    return List.generate(length, (int index) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        child: AspectRatio(
          aspectRatio: 492.0 / 521.0,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 492.0 / 309.0,
                  child: Image.asset(
                    'images/' + videoList[index].pic,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10.0),
                  child: Text(
                    videoList[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10, right: 10.0, top: 5.0),
                  child: Center(
                    child: Text(
                      videoList[index].name,
                      style: TextStyle(
                        color: Color.fromRGBO(144, 144, 144, 1.0),
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello flutter',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
        appBar: AppBar(
          title: Text('Hello World'),
          backgroundColor: Colors.amber,
          elevation: 0.0,
          actions: <Widget>[
            Icon(Icons.search),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(12),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2,
          children: _gridViewBuilder(videoList.length),
        ),
      ),
    );
  }
}
