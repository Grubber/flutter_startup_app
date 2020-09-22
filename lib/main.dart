import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_startup_app/second.dart';

void main() => runApp(StartupApp());

class StartupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter startup app",
      initialRoute: "/",
      routes: {
        "/": (_) => RandomWords(),
        SecondPage.routeName: (_) => SecondPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter startup app"),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () => Navigator.pushNamed(
                    context,
                    SecondPage.routeName,
                    arguments: _saved,
                  )),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (_, index) => _buildRow(index),
      ),
    );
  }

  Widget _buildRow(int index) {
    if (index.isOdd) return Divider();

    if (index >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }
    final _alreadySaved = _saved.contains(_suggestions[index]);
    return ListTile(
      title: Text(
        _suggestions[index].asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _saved.remove(_suggestions[index]);
          } else {
            _saved.add(_suggestions[index]);
          }
        });
      },
    );
  }
}
