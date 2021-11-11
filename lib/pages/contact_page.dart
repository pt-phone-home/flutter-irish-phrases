import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/components.dart';
import '../constants.dart';

class ContactPage extends StatelessWidget {
  static const routeName = '/contact';
  final String title;

  const ContactPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(
            height: 10,
          ),
          Text(
            'Hi / Dia Duit',
            style: kPhraseTextStyle,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'This app was developed by Peter Tiernan'
                    ' of Rocket.Chip Web Solutions. If you have any questions or suggestions, '
                    'or you would like to get in touch with a fellow Irish learner and enthusiast, '
                    'please email or connect with Peter on Twitter '
                    , style: TextStyle(fontSize: 16, height: 1.5),),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('info@rocketchipwebsolutions.ie', style: kContactDetails,),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('@tweet_to_pete', style: kContactDetails,),
          ),
        ],
      ),
    );
  }
}
