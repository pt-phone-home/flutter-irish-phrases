import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings_page';
  String title;

  SettingsPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('You can adjust certain settings for the app below.'),
              Row(
                children: [
                  Text('Turn on / off daily phrase notifications'),
                  Switch(
                      value: Provider.of<SharedPreferencesFunctions>(context)
                          .getNotificationSettingsFromStorage(),
                      onChanged: (value) {
                        setState(() {
                          Provider.of<SharedPreferencesFunctions>(context,
                                  listen: false)
                              .toggleNotificationSettingsInStorage();

                        });
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// class NotificationPreferences extends StatefulWidget {
//   const NotificationPreferences({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<NotificationPreferences> createState() => _NotificationPreferencesState();
// }
//
// class _NotificationPreferencesState extends State<NotificationPreferences> {
//   @override
//
//   late bool notifications;
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _setNotificationSetting();
//   }
//
//   _setNotificationSetting() async {
//     notifications = (await SharedPreferencesFunctions().getNotificationSettingFromStorage())!;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text('Turn on / off daily phrase notifications'),
//         Switch(value: notifications,
//             onChanged: (value) {
//           // SharedPreferencesFunctions().toggleNotificationSettingsInStorage();
//         })
//       ],
//     );
//   }
// }
