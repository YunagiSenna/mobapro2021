import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadai/scr/ScreenA.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "kadai",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _button = "本日の接種カロリーを表示";

  var _breakfastController = TextEditingController();
  var _lunchController = TextEditingController();
  var _dinnerController = TextEditingController();

  double _breakfast = 0;
  double _lunch = 0;
  double _dinner = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _breakfastController = new TextEditingController(); //textfieldに初期値を設定する
      _lunchController = new TextEditingController();
      _dinnerController = new TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("食事記録"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 280,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "食べたものを入力してください。",
                  ),
                ),
              ),
              Container(
                color: Colors.blueGrey,
                width: 80,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //入力を数字のみにする
                  decoration: InputDecoration(
                    hintText: "kcal",
                  ),
                  controller: _breakfastController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 280,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "食べたものを入力してください。",
                  ),
                ),
              ),
              Container(
                color: Colors.blueGrey,
                width: 80,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //入力を数字のみにする
                  decoration: InputDecoration(
                    hintText: "kcal",
                  ),
                  controller: _lunchController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 280,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "食べたものを入力してください。",
                  ),
                ),
              ),
              Container(
                color: Colors.blueGrey,
                width: 80,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //入力を数字のみにする
                  decoration: InputDecoration(
                    hintText: "kcal",
                  ),
                  controller: _dinnerController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  _breakfast =
                      double.parse(_breakfastController.text); //strからdoubleに
                  _lunch = double.parse(_lunchController.text);
                  _dinner = double.parse(_dinnerController.text);
                  double sum = _breakfast + _lunch + _dinner; //合計カロリー
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenA(sum.toString()); //合計値を別スクリーンへ
                  }));
                },
                child: Text(_button)),
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
