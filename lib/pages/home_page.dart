import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/phrase_data.dart';
import '../components/components.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';
  final String title;

  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // List<String> favourites = [];
  // initState() {
  //  _loadFavourites();
  // }

  // Future<List<String>>_loadFavourites() async {
  //   List<String>? updatedList = await SharedPreferencesFunctions.getFavouritesFromStorage();
  //   if (updatedList != ['']) {
  //     return favourites = updatedList ?? [''];
  //   } else {
  //     return favourites = [''];
  //   }
  //
  // }

  // Future<void> toggleFavourites(int id) async {
  //   print(id);
  //   favourites = (await SharedPreferencesFunctions.getFavouritesFromStorage())!;
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

  // bool isFavourite(int id)  {
  //   var stringId = id.toString();
  //   return favourites.contains(stringId) ? true : false;
  // }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: const AppDrawer(),
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final phrases =
                      Provider.of<PhraseData>(context).getRandomPhrases();
                  return PhraseListTile(
                    id: phrases[index].id,
                    english: phrases[index].english,
                    irish: phrases[index].irish,
                    // isFavouriteCallback: isFavourite,
                    // toggleFavouriteCallback: toggleFavourites,

                  );
                },
                itemCount: Provider.of<PhraseData>(context).getRandomPhrases().length,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<PhraseData>(context, listen: false)
                      .updateRandomPhrases();
                  // _loadFavourites();
                },
                child: const Text('Tap for another 10 phrases')),
          ],
        ),
      ),
    );
  }
}


