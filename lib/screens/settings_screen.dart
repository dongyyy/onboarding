
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/screens/privacy_screen.dart';
import 'package:provider/provider.dart';

import '../constants/sizes.dart';
import '../darkmode/config_model.dart';
import '../darkmode/config_vm.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        foregroundColor: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
        backgroundColor:  context.watch<ConfigViewModel>().darkMode ? Colors.black :Colors.white,
        centerTitle: true,
        title: Text('Settings'
            ,style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),),
      ),
      body: Container(
        color: context.watch<ConfigViewModel>().darkMode ? Colors.black:Colors.white ,
        child: ListView(
          children: [
            SwitchListTile.adaptive(value: context.watch<ConfigViewModel>().darkMode,
              onChanged: (value) => context.read<ConfigViewModel>().setDarkMode(value),
              title: Text("Dark Mode",
              style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),),
              subtitle: Text("Dark Mode on"
                ,style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),),
            ),
            ListTile(
              onTap: () => showAboutDialog(
                  context: context,
                  applicationVersion: "1.0",
                  applicationLegalese:
                      "All rights reseverd. Please dont copy me."),
              leading: FaIcon(FontAwesomeIcons.userPlus,
                  size: Sizes.size20, color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),
              title: Text(
                "Follow and invite friends",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.bell,
                  size: Sizes.size20, color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),
              title: Text(
                "Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            ListTile(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyScreen(),
                  ),
                )
              },
              leading: FaIcon(FontAwesomeIcons.lock,
                  size: Sizes.size20, color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),
              title: Text(
                "Privacy",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color : context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
             ListTile(
              leading: FaIcon(FontAwesomeIcons.circleUser,
                  size: Sizes.size20, color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),
              title: Text(
                "Account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
             ListTile(
              leading: FaIcon(FontAwesomeIcons.circleQuestion,
                  size: Sizes.size20, color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),
              title: Text(
                "Help",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
             ListTile(
              leading: FaIcon(FontAwesomeIcons.circleInfo,
                  size: Sizes.size20, color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,),
              title: Text(
                "Help",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(width: 1, color: Colors.grey))),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          _showMyDialog(context)
                        },
                        child: Text(
                          "Log out",
                          style: TextStyle(
                            fontSize: 15,
                            color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CircularProgressIndicator()
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.watch<ConfigViewModel>().darkMode ? Colors.black: Colors.white,
          title: Text('LogOut Dialog',style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Log out', style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,)),
                Text('Do you want log out?',style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('yes',style: TextStyle(color: context.watch<ConfigViewModel>().darkMode ? Colors.white : Colors.black,)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
