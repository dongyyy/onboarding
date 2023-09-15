import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/darkmode/config_model.dart';
import 'package:onboarding/darkmode/config_vm.dart';
import 'package:provider/provider.dart';

import '../constants/sizes.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        foregroundColor: context.watch<ConfigModel>().darkMode ? Colors.white : Colors.black,
        backgroundColor:  context.watch<ConfigModel>().darkMode ? Colors.black :Colors.white,
        centerTitle: true,
        title: const Text('Privacy'),
      ),
      body: ListView(
        children: [
          const SwitchListTileExample(),
          SwitchListTile.adaptive(value: context.watch<ConfigViewModel>().darkMode,
              onChanged: (value) => context.read<ConfigViewModel>().setDarkMode(value),
            title: const Text("Dark Mode",),
            subtitle:  const Text("Dark Mode on"),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.at,
                size: Sizes.size20, color: Colors.black),
            title: Text(
              "Mentions",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.volumeXmark,
                size: Sizes.size20, color: Colors.black),
            title: const Text(
              "Muted",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.eyeSlash,
                size: Sizes.size20, color: Colors.black),
            title: Text(
              "Hidden Words",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.users,
                size: Sizes.size20, color: Colors.black),
            title: Text(
              "Profiles you follow",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => {_showMyDialog(context)},
                        child: const Text(
                          "Other privacy settings",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const FaIcon(
                        FontAwesomeIcons.upRightFromSquare,
                        size: Sizes.size20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Gaps.v10,
                  const Text(
                    "Some Settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('LogOut Dialog'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Log out'),
                Text('Do you want log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('yes'),
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

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({super.key});

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text(
        "Dark Mode",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
      secondary: const FaIcon(FontAwesomeIcons.lock,
          size: Sizes.size20, color: Colors.black),
    );
  }
}
