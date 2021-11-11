import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class FavouritesPage extends StatefulWidget {
  static const routeName = '/favourites';
  final String title;

  FavouritesPage({required this.title});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Text(
                  'Swipe left or right on a favourite to remove it.',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final favourites = Provider.of<SharedPreferencesFunctions>(context).getFavourites();
                return FavouriteListTile(
                    id: favourites[index].id,
                    english: favourites[index].english,
                    irish: favourites[index].irish,
                );
              },
              itemCount: Provider.of<SharedPreferencesFunctions>(context).getFavourites().length,
            ),
          ),
        ],
      ),
    );
  }
}

class FavouriteListTile extends StatelessWidget {
  const FavouriteListTile({
    Key? key,
    required this.id,
    required this.english,
    required this.irish,
  }) : super(key: key);

  final int id;
  final String english;
  final String irish;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id.toString()),
      onDismissed: (direction) {
        Provider.of<SharedPreferencesFunctions>(context, listen: false).removeFavourite(id);
      },
      child: Card(
        child: ListTile(
          tileColor: Colors.white70,
          dense: true,
          title: Text(english),
          subtitle: Text(
            irish,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
