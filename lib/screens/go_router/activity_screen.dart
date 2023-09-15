import 'package:flutter/material.dart';



class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("ActivityScreen", style: TextStyle(fontSize: 40),),
            Text("과제를 못해서 구현 못한 화면", style: TextStyle(fontSize: 30),),
          ],
        )
      ),
    );
  }
}
