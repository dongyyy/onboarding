import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/constants/gaps.dart';
import 'package:onboarding/constants/sizes.dart';
import 'package:onboarding/screens/camera/video_recording_screen.dart';

class PicturePostScreen extends StatefulWidget {
  const PicturePostScreen({Key? key}) : super(key: key);

  @override
  State<PicturePostScreen> createState() => _PicturePostScreenState();
}

class _PicturePostScreenState extends State<PicturePostScreen> {
  var haveImage = false;
  var imagePath = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: Sizes.size56),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            // IconButton(onPressed: onPicturePostPressed(), icon: Icons.clip)
            GestureDetector(
              onTap: () => _navigateAndReturnData(context),
              child: const FaIcon(FontAwesomeIcons.paperclip,
                  size: Sizes.size30, color: Colors.black),
            ),

            Gaps.v40,

            haveImage? Expanded(child: Image.file(File(imagePath))) :
            const Text(
              "Image Area",
              style: TextStyle(fontSize: Sizes.size30, color: Colors.black),
            )
          ],
        ),
      ),
    ));
  }

  // onPicturePostPressed(context) {
  Future<void> _navigateAndReturnData(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VideoRecordingScreen()),
    );

    // // After the Selection Screen returns a result, hide any previous snackbars
    // // and show the new result.
    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text('$result')));

    print(result);
    setState(() {
      haveImage = true;
      imagePath = result;
    });
  }
}
