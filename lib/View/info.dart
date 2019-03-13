import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thak/View/addinfo.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) =>
              new Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: new Center(
                    child: Column(
                      children: <Widget>[
                        Text("타이틀"),
                        Text("국어"),
                        Text("n학년 n학기"),
                      ],
                    ),
                  )),
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(1, 0.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            )
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            AddButtonClicked();
          },
          child: Icon(Icons.add),
        )
    );
  }

  String a = "aa";
  AddButtonClicked() {
//    Dialog errorDialog = Dialog(
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
//      child: Container(
//        height: 300.0,
//        width: 300.0,
//
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//              CupertinoTextField(
//                maxLines: null,
//                placeholder: "제목",
//                textInputAction: TextInputAction.next,
//                onChanged: (s) {
//                  ;
//                },
//              ),
//              Container(
//                  child: DropdownButton<String>(
//                    hint: new Text("$a"),
//                    items: <String>['-','국어', "영어", '수학', '제2외국어'].map((String value) {
//                      return new DropdownMenuItem<String>(
//                        value: value,
//                        child: new Text(value),
//                      );
//                    }).toList(),
//                    onChanged: (newVal) {
//
//                    },
//                  )
//              ),
//              Container(
//                  child: DropdownButton<String>(
//                    hint: new Text("과목"),
//                    items: <String>['-','국어', "영어", '수학', '제2외국어'].map((String value) {
//                      return new DropdownMenuItem<String>(
//                        value: value,
//                        child: new Text(value),
//                      );
//                    }).toList(),
//                    onChanged: (newVal) {
//
//                      setState(() {
//                        a = newVal;
//                      });
//                    },
//                  )
//              ),
//            ],
//        ),
//      ),
//    );
//    showDialog(
//
//        context: context,
//        builder: (BuildContext context)  => errorDialog
//    );
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddInfo())
    );
  }

}
