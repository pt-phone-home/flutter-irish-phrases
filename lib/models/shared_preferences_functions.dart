import 'package:flutter/material.dart';
import 'package:irish_phrases/models/phrase.dart';
import 'package:irish_phrases/models/phrase_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions extends ChangeNotifier {

final SharedPreferences prefs;
SharedPreferencesFunctions(this.prefs);

/// FUNCTIONS FOR FAVOURITES

bool isFavourite(int id)  {
  List<String> favouriteList = prefs.getStringList('favouritePhrases') ?? [''];
  var stringId = id.toString();
  return favouriteList.contains(stringId) ? true : false;
}

void toggleFavourites(int id) {
  List<String> favouriteList = prefs.getStringList('favouritePhrases') ?? [''];
  var stringId = id.toString();
  favouriteList.contains(stringId)
      ? favouriteList.remove(stringId)
      : favouriteList.add(stringId);
  prefs.setStringList('favouritePhrases', favouriteList);
  notifyListeners();
}

void removeFavourite(int id) {
  List<String> favouriteList = prefs.getStringList('favouritePhrases') ?? [''];
  var stringId = id.toString();
  favouriteList.remove(stringId);
  prefs.setStringList('favouritePhrases', favouriteList);
  notifyListeners();
}

List<Phrase> getFavourites() {
  List<String> favouriteList = prefs.getStringList('favouritePhrases') ?? [''];
  return PhraseData()
      .phrases
      .where((phrase) {
    final phraseString = phrase.id.toString();
    return favouriteList.contains(phraseString);
  }).toList();
}
    static Future<List<String>?> getFavouritesFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favouriteList = prefs.getStringList('favouritePhrases');
   if (favouriteList != ['']) {
     return favouriteList;
   } else {
     return [''];
   }
  }

  static Future<void> setFavouritesToStorage (List<String> updatedList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favouritePhrases', updatedList);
  }

  /// FUNCTIONS FOR SETTINGS PAGE

  bool getNotificationSettingsFromStorage() {
      return prefs.getBool('notificationSetting') ?? true;
  }


  void toggleNotificationSettingsInStorage() {
      prefs.getBool('notificationSetting') == true ? prefs.setBool('notificationSetting', false) : prefs.setBool('notificationSetting', true);
  }
}
