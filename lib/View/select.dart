import 'package:flutter/material.dart';
import 'package:thak/Model/TypeModel.dart';

class SelectPage extends  StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectStatePageState();
  SelectPage({Key key, this.source, this.sourceIndexed}) : super(key: key);

  int sourceIndexed;
  List<TypeModel> source;
}
class _SelectStatePageState extends State<SelectPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: buildListView()
    );
    ;
  }
  ListView buildListView() {
    print("dd");
    return ListView.separated(
              itemBuilder: (context, index){
                return
                    Padding(
                      padding:const EdgeInsets.only(top: 16.0,left: 24.0),
                      child : GestureDetector(
                          onTap: (){
                            Navigator.pop(context, [widget.sourceIndexed, index]);
                            },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:const EdgeInsets.only(bottom: 8),
                                  child : Text(widget.source[index].Title, style: Theme.of(context).textTheme.subhead),
                                ),
                                Text(widget.source[index].Hint, style: Theme.of(context).textTheme.subtitle)
                              ],
                            ),
                          )
                      )
                    );
              },
              separatorBuilder: (context,int) {
                return Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(
                      color: Colors.grey,
                    )
                );
              }
              , itemCount: widget.source.length
          );
  }

}