import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thak/Manager/DataManager.dart';
import 'package:thak/Model/PostModel.dart';
import 'package:thak/Model/TypeModel.dart';
import 'package:thak/View/info.dart';
import 'package:thak/View/select.dart';
import 'package:fluttertoast/fluttertoast.dart';


class WritePage extends StatefulWidget{
  final String title = "Thac으로 멋진 활동을\n기록해 보아요.";

  @override
  State<StatefulWidget> createState() => _WritePageState();


}

class _WritePageState extends State<WritePage> {
  PostModel data = new PostModel();
  _WritePageState(){
    DataManager().a.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "저장 완료!!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              DataManager().savePost();
            },
            ),
          ]
      ),
      body: buildListView(context)
    );
  }


  var litems = [
    ["우선 기본정보 부터 입력하죠", "학기, 담당교사, 행사명등을 입력합니다"],
    ["무슨 호기심을 느꼇나요?", "내가가진 호기심은..."],
    ["어떤 사고 방법을 사용했나요?", "내가 호기심을 해결할때 사용한 활동은..."],
    ["호기심을 해결한 후 변화가 있엇나?", "나에게 일어난 변화는..."],
    ["호기심을 해결한 후 무엇을 햇었나", "호기심을 해결한 후 내가 한것은..."]
  ];


  buildListView(BuildContext context) {
    return
        new SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  _MakeStepCell()),
        )
    ;
  }
  bool a = false;
  List<Widget> _MakeStepCell() {
    List<Widget> rtn = new List<Widget>();
    //Header
    rtn.add(Container(
        decoration: BoxDecoration(color: Theme
            .of(context)
            .primaryColor),
        height: 200,
        width: 500,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 20.0),
              child: Text(widget.title, style: Theme
                  .of(context)
                  .textTheme
                  .display1,),
            )
          ],
        )
    ));

    for(final val in litems){
      int i =litems.indexOf(val);
      rtn.add(
          Padding(padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(val[0], style: Theme
                        .of(context)
                        .textTheme
                        .subhead,),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(val[1], style: Theme
                          .of(context)
                          .textTheme
                          .subtitle)
                  ),
                  Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new RaisedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '계속하기', style: Theme
                                .of(context)
                                .textTheme
                                .button,
                            ),
                          ),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          splashColor: Theme
                              .of(context)
                              .primaryColorLight,
                          onPressed: () {
                            _navigateAndDisplaySelection(context, i);
                          },
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: i==0 ?Text(""): Container(
                          child: (data.select[i-1] == -1) ? Text(""): buildInput(i-1)
                      )
                  ),
                ]
            )
          ));
    }

    return rtn;
  }

  void _navigateAndDisplaySelection(BuildContext context, index) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    if(index == 0){
      List<int> result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new InfoPage())
      );
      setState(() {
      });

    }else {
      List<int> result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              SelectPage(sourceIndexed: index - 1, source: DataManager()
                  .instance()
                  .select[index - 1]))
      );
      setState(() {
        data.select[result[0]] = result[1];
      });
    }
  }


  buildInput(int index) {
    int code = data.select[index];
    TypeModel item = DataManager().instance().select[index][code];

    List<Widget> content = new List();
    item.Answer.forEach(
        (e){
          int index = item.Answer.indexOf(e);

          content.add(
              CupertinoTextField(
                maxLines: null,
//                keyboardType: TextInputType.multiline,
                placeholder: item.AnswerHint[index],
                textInputAction: TextInputAction.next,
                onChanged: (s){data.answer[code][index] = s;},
              )
          );
          content.add(
              Padding(padding: const EdgeInsets.only(left: 4.0),
                  child: Text(item.Answer[index]))
          );
        }
    );

    return Column(
      children: content,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }




}