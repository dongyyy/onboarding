import 'package:flutter/material.dart';



class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("SearchScreen", style: TextStyle(fontSize: 40),),
            Text("과제를 못해서 구현 못한 화면", style: TextStyle(fontSize: 30),),
          ],
        )
      ),
    );
  }
}
