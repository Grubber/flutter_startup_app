import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_startup_app/favorite_model.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  static const routeName = "/secondPage";

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final _model = context.watch<FavoriteModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("favorite list"),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: _model.data.map((e) => ListTile(
                title: Text(
                  e.asPascalCase,
                  style: TextStyle(fontSize: 18),
                ),
                onLongPress: () => _model.remove(e),
              )),
        ).toList(),
      ),
    );
  }
}
