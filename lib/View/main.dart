import 'package:flutter/material.dart';
import 'package:thak/Manager/DataManager.dart';
import 'package:thak/View/write.dart';
import 'dart:math' as math;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Thak',
      theme: ThemeData(
        primarySwatch: MaterialColor(Color(0xFFF18C81).value, {
                50:  Colors.pink.shade50,
                100: Colors.pink.shade100,
                200: Colors.pink.shade200,
                300: Colors.pink.shade300,
                400: Colors.pink.shade400,
                500: Colors.pink.shade500,
                600: Colors.pink.shade600,
                700: Colors.pink.shade700,
                800: Colors.pink.shade800,
                900: Colors.pink.shade900
              }),
        primaryColor: Color(0xFFF18C81),
        textTheme: TextTheme(
          title: TextStyle( color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20),
          display1: TextStyle( color: Colors.white, fontWeight: FontWeight.w200 , fontSize: 36),
          button: TextStyle( color: Colors.white, fontWeight: FontWeight.w300 , fontSize: 16),
          subhead: TextStyle( color: Colors.black, fontWeight: FontWeight.bold , fontSize: 20),
        )
      ),
      home: MainPage(title: 'Thak'),
    );
  }
}

class MainPage extends StatefulWidget {


  MainPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  AnimationController _controller;


  static const List<IconData> icons = const [ Icons.search, Icons.send ,Icons.add ];


  @override
  void initState() {
    super.initState();



    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style:  Theme.of(context).textTheme.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
//            BuildList(),

          ],
        ),
      ),

      floatingActionButton: new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                    0.0,
                    1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut
                ),
              ),
              child: new FloatingActionButton(
                heroTag: null,
                mini: true,
                child: new Icon(icons[index], color: Colors.white),
                onPressed: () {
                  onFabPress(index);
                },
              ),
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            heroTag: null,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.add : Icons.close),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
      ),
    );



  }

  void onFabPress(int index) {
    switch(index){
      case 0 :
        onSearchPressed();
        break;
      case 1 :
        onSendPressed();
        break;
      case 2 :
        onAddPressed();
        break;
    }
  }

  void onSearchPressed() {

  }

  void onSendPressed() {
    DataManager().loadPost();
  }

  void onAddPressed() {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WritePage())
      );
  }

  BuildList() {

//    return
  }
}
