import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thak/Manager/DataManager.dart';
import 'package:thak/Model/InfoModel.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {

  InfoModel _infoModel = new InfoModel();

  List<String> subjects = DataManager().subjects;
  List<String> grade = DataManager().grade;
  List<String> term = DataManager().term;
  final TitleController = TextEditingController();
  final EmailController = TextEditingController();
  
  Form form;

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    form = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );


    return Scaffold(
      body: Container(
        child: Padding(padding: const EdgeInsets.only(top: 20,left: 20, right: 20),
        child: Column(
          children: <Widget>[
            CupertinoTextField(
              maxLines: null,
              placeholder: '제목',
              textInputAction: TextInputAction.next,
              onChanged: (s) {
                _infoModel.Title = s;
              },
            ),

            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("과목"),
                  ),
                  DropdownButton<String>(
                    hint: new Text("과목"),
                    value: "${subjects[_infoModel.subject]}",
                    items: subjects.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        _infoModel.subject = subjects.indexOf(newVal);
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text("email.")
            )
          ],
        )
    ),
      )
         //pop
    );
  }
}
