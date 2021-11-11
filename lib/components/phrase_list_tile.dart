import 'package:flutter/material.dart';
import 'package:irish_phrases/models/shared_preferences_functions.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import '../constants.dart';

class PhraseListTile extends StatefulWidget {
  const PhraseListTile({
    Key? key,
    required this.id,
    required this.english,
    required this.irish,
    // required this.isFavouriteCallback,
    // required this.toggleFavouriteCallback,

  }) : super(key: key);

  final int id;
  final String english;
  final String irish;
  // final Function isFavouriteCallback;
  // final Function toggleFavouriteCallback;


  @override
  State<PhraseListTile> createState() => _PhraseListTileState();


}

class _PhraseListTileState extends State<PhraseListTile> {

  // List<String> favourites = [];
  // initState() {
  //   _loadFavourites();
  // }

  // Future<List<String>>_loadFavourites() async {
  //   List<String>? updatedList = await SharedPreferencesFunctions.getFavouritesFromStorage();
  //   if (updatedList != ['']) {
  //     return favourites = updatedList!;
  //   } else {
  //     return favourites = [''];
  //   }

  // }
 //
 // Future<void>_getFavouritesFromStorage() async {
 //    final prefs = await SharedPreferences.getInstance();
 //     var favouriteList = prefs.getStringList('favouritePhrases');
 //    if (favouriteList != null) {
 //      setState(() {
 //        favourites = favouriteList;
 //      });
 //    } else {
 //      setState(() {
 //        favourites = [];
 //      });
 //    }
 //
 //  }
 //


 //  bool isFavourite(int id)  {
 //    var stringId = id.toString();
 //    return favourites.contains(stringId) ? true : false;
 //  }

  // Future<void> toggleFavourites(int id) async {
  //   print(id);
  //   favourites = (await SharedPreferencesFunctions.getFavouritesFromStorage()) ?? [''];
  //   var stringId = id.toString();
  //   setState(()  {
  //     favourites.contains(stringId)
  //         ? favourites.remove(stringId)
  //         : favourites.add(stringId);
  //     SharedPreferencesFunctions.setFavouritesToStorage(favourites);
  //     // SharedPreferencesFunctions.getFavouritesFromStorage();
  //
  //   });
  //
  // }
 //
 //    bool isFavourite(int id)  {
 //    var stringId = id.toString();
 //    return favourites.contains(stringId) ? true : false;
 //  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.white70,
        dense: true,
        title: Text(widget.english),
        subtitle: Text(
          widget.irish,
          style: kIrishTextStyle,
        ),
        // trailing: isFavourite(widget.id)
        trailing: Provider.of<SharedPreferencesFunctions>(context).isFavourite(widget.id)
            ? Icon(
          Icons.star,
          color: Theme.of(context).primaryColor,
        )
            : Icon(
          Icons.star_outline,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () {
          // Provider.of<FavouritePhrases>(context, listen: false).toggleFavourite(widget.id);
          // widget.toggleFavouriteCallback(widget.id);
          // toggleFavourites(widget.id);
          Provider.of<SharedPreferencesFunctions>(context, listen: false).toggleFavourites(widget.id);
        },
      ),
    );
  }
}
