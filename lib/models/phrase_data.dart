import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'phrases_collection.dart';

import './phrase.dart';
import './phrases_collection.dart';

class PhraseData extends ChangeNotifier {
  List<Phrase> phrases = phraseCollection;
  // List<int> phrasesThatHaveBeenFavourited = FavouritePhrases().favouritePhrases;

  Phrase getRandomPhrase() {
    final random = Random().nextInt(phrases.length);
    var element = phrases[random];
    return element;
  }

  List<Phrase> getRandomPhrases() {
    List<Phrase> randomPhrases = [];
    for (int i = 0; i < 9; i++) {
      Random random = Random();
      int randomNumber = random.nextInt(phrases.length);
      var element = phrases[randomNumber];
      randomPhrases.add(element);
    }
    return randomPhrases;
  }

  void updateRandomPhrases() {
    getRandomPhrase();
    notifyListeners();
  }

  List<Phrase> searchResults = [];

  List<String> getQueryList(String query) {
    return query.trim().split(' ').toList();
  }

void updateSearchResults(String search) {
    searchResults = phrases.where((phrase) => phrase.english.contains(search.toLowerCase()) || phrase.irish.contains(search.toLowerCase())).take(50).toList();
    notifyListeners();
}

}
