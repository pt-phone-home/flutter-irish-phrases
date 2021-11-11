import 'package:flutter/material.dart';
import 'package:irish_phrases/models/shared_preferences_functions.dart';
import 'package:irish_phrases/pages/favourites_page.dart';
import 'package:irish_phrases/pages/search_page.dart';
import 'package:irish_phrases/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/home_page.dart';
import './pages/contact_page.dart';
import './models/models.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // prefs.getStringList('favouritesPhrases');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PhraseData>(create: (context) => PhraseData(),),
    ChangeNotifierProvider<SharedPreferencesFunctions>(create: (context) => SharedPreferencesFunctions(prefs))
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Irish Clichés and Phrases'),
        FavouritesPage.routeName: (context) => FavouritesPage(
              title: 'Favourites',
            ),
        SearchPage.routeName: (context) => SearchPage(title: 'Search'),
        ContactPage.routeName: (context) => ContactPage(title: 'Contact'),
        SettingsPage.routeName: (context) => SettingsPage(title: 'Settings'),
      },
    );
  }
}



