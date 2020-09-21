import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void startSecondPage(BuildContext context, Set<WordPair> data) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
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
      },
    ),
  );
}
