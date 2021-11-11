import 'package:flutter/material.dart';
import '../pages/pages.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Phrases'),
            onTap: () {
              Navigator.pushNamed(context, MyHomePage.routeName);
            },

          ),
           ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favourites'),
            onTap: () {
              Navigator.pushNamed(context, FavouritesPage.routeName);
            },
          ),
           ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
          ),
           ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pushNamed(context, ContactPage.routeName);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text('Settings'),
          //   onTap: () {
          //     Navigator.pushNamed(context, SettingsPage.routeName);
          //   },
          // ),
        ],
      ),
    );
  }
}
