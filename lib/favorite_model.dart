import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class FavoriteModel extends ChangeNotifier {
  final Set<WordPair> _saved = Set<WordPair>();

  Set<WordPair> get data => _saved;

  void add(WordPair wordPair) {
    if (!_saved.contains(wordPair)) {
      _saved.add(wordPair);
      notifyListeners();
    }
  }

  void remove(WordPair wordPair) {
    if (_saved.contains(wordPair)) {
      _saved.remove(wordPair);
      notifyListeners();
    }
  }

  bool contains(WordPair wordPair) => _saved.contains(wordPair);
}
