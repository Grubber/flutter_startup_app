import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static const routeName = "/secondPage";

  @override
  Widget build(BuildContext context) {
    final Set<WordPair> data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("favorite list"),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: data.map((e) => ListTile(
                title: Text(
                  e.asPascalCase,
                  style: TextStyle(fontSize: 18),
                ),
              )),
        ).toList(),
      ),
    );
  }
}
