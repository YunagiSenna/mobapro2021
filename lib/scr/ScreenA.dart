import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  String _textPassedFromMain;

  ScreenA(this._textPassedFromMain);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("接種カロリー"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 130,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(
              "$_textPassedFromMain kcal",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
