import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:irish_phrases/models/phrase_data.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  String title;

  SearchPage({required this.title});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<String> favourites = [];
  initState() {
    _loadFavourites();
  }

  Future<List<String>>_loadFavourites() async {
    List<String>? updatedList = await SharedPreferencesFunctions.getFavouritesFromStorage();
    if (updatedList != ['']) {
      return favourites = updatedList!;
    } else {
      return favourites = [''];
    }

  }

  Future<void> toggleFavourites(int id) async {
    favourites = SharedPreferencesFunctions.getFavouritesFromStorage() as List<String>;
    var stringId = id.toString();
    setState(()  {
      favourites.contains(stringId)
          ? favourites.remove(stringId)
          : favourites.add(stringId);
      SharedPreferencesFunctions.setFavouritesToStorage(favourites);
      SharedPreferencesFunctions.getFavouritesFromStorage();
      print(favourites);
    });

  }
  bool isFavourite(int id)  {
    var stringId = id.toString();
    return favourites.contains(stringId) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Start typing to search'),
                    onChanged: (newValue) {
                      Provider.of<PhraseData>(context, listen: false).updateSearchResults(newValue);

                    },
                  ),
                ),
              ),
              const Icon(
                Icons.search,
              )
            ],
          ),
          const SizedBox(height: 10,),
          Provider.of<PhraseData>(context).searchResults.isNotEmpty ?
          Expanded(
            child: ListView.builder(
                itemCount: Provider.of<PhraseData>(context).searchResults.length ,itemBuilder: (context, index) {
              var searchResults = Provider.of<PhraseData>(context).searchResults;
              return PhraseListTile(id: searchResults[index].id,
                english: searchResults[index].english,
                irish: searchResults[index].irish,
                // isFavouriteCallback: isFavourite,
                // toggleFavouriteCallback: toggleFavourites,
              );
            },),
          ) : const SizedBox(height: 5,)
        ],

      ),
    );
  }
}
