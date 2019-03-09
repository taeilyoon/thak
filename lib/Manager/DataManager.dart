import 'package:thak/Model/PostModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:thak/Model/TypeModel.dart';

class DataManager{
  static final DataManager _DataManager = new DataManager._internal();
  final POSTKEY = "POSTKEY";
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  List<PostModel> a = new List();


  DataManager instance() => _DataManager;

  var select = [
    [
      TypeModel(t: "본질/요건/개념/다른 것과의 차이점", h: "OO는 어떤 거죠", a: ["이/가 어떤 것인지 호기심을 갖고,"],ah :["[예 : 친구]"]),
      TypeModel(t: "장점/효과/의의 : 단점/한계/문제점 ", h: "OO의 장점 또는 단점이 뭐죠?", a: ["의 장단점을 파악하고 싶어서,"],ah :["[예 : 핸드폰]"]),
      TypeModel(t: "사례/종류/갈래/구분/분류", h: "OO에는 어떤 것들이 있죠", a: ["에 어떤 것이 있는지 궁금해,"],ah :["[예 : 프로그래밍 언어]"]),
      TypeModel(t: "구조:구성요소/성분/부분/부속/부품 ", h: "OO은 무엇들로 구성되어있죠?", a: ["이/가 무엇으로 이루어 졌는지 관심을 갖고,"],ah :["[예 : 컴퓨터]"])
    ],
    [
      TypeModel(t: "본질/요건/개념/다른 것과의 차이점", h: "OO는 어떤 거죠", a: ["이/가 어떤 것인지 호기심을 갖고,"],ah :["[예 : 친구]"]),
      TypeModel(t: "장점/효과/의의 : 단점/한계/문제점 ", h: "OO의 장점 또는 단점이 뭐죠?", a: ["의 장단점을 파악하고 싶어서,"],ah :["[예 : 핸드폰]"]),
      TypeModel(t: "사례/종류/갈래/구분/분류", h: "OO에는 어떤 것들이 있죠", a: ["에 어떤 것이 있는지 궁금해,"],ah :["[예 : 프로그래밍 언어]"]),
      TypeModel(t: "구조:구성요소/성분/부분/부속/부품 ", h: "OO은 무엇들로 구성되어있죠?", a: ["이/가 무엇으로 이루어 졌는지 관심을 갖고,"],ah :["[예 : 컴퓨터]"])
    ],
    [
      TypeModel(t: "본질/요건/개념/다른 것과의 차이점", h: "OO는 어떤 거죠", a: ["이/가 어떤 것인지 호기심을 갖고,"],ah :["[예 : 친구]"]),
      TypeModel(t: "장점/효과/의의 : 단점/한계/문제점 ", h: "OO의 장점 또는 단점이 뭐죠?", a: ["의 장단점을 파악하고 싶어서,"],ah :["[예 : 핸드폰]"]),
      TypeModel(t: "사례/종류/갈래/구분/분류", h: "OO에는 어떤 것들이 있죠", a: ["에 어떤 것이 있는지 궁금해,"],ah :["[예 : 프로그래밍 언어]"]),
      TypeModel(t: "구조:구성요소/성분/부분/부속/부품 ", h: "OO은 무엇들로 구성되어있죠?", a: ["이/가 무엇으로 이루어 졌는지 관심을 갖고,"],ah :["[예 : 컴퓨터]"])
    ],
    [
      TypeModel(t: "본질/요건/개념/다른 것과의 차이점", h: "OO는 어떤 거죠", a: ["이/가 어떤 것인지 호기심을 갖고,"],ah :["[예 : 친구]"]),
      TypeModel(t: "장점/효과/의의 : 단점/한계/문제점 ", h: "OO의 장점 또는 단점이 뭐죠?", a: ["의 장단점을 파악하고 싶어서,"],ah :["[예 : 핸드폰]"]),
      TypeModel(t: "사례/종류/갈래/구분/분류", h: "OO에는 어떤 것들이 있죠", a: ["에 어떤 것이 있는지 궁금해,"],ah :["[예 : 프로그래밍 언어]"]),
      TypeModel(t: "구조:구성요소/성분/부분/부속/부품 ", h: "OO은 무엇들로 구성되어있죠?", a: ["이/가 무엇으로 이루어 졌는지 관심을 갖고,"],ah :["[예 : 컴퓨터]"])
    ],
    [
      TypeModel(t: "본질/요건/개념/다른 것과의 차이점", h: "OO는 어떤 거죠", a: ["이/가 어떤 것인지 호기심을 갖고,"],ah :["[예 : 친구]"]),
      TypeModel(t: "장점/효과/의의 : 단점/한계/문제점 ", h: "OO의 장점 또는 단점이 뭐죠?", a: ["의 장단점을 파악하고 싶어서,"],ah :["[예 : 핸드폰]"]),
      TypeModel(t: "사례/종류/갈래/구분/분류", h: "OO에는 어떤 것들이 있죠", a: ["에 어떤 것이 있는지 궁금해,"],ah :["[예 : 프로그래밍 언어]"]),
      TypeModel(t: "구조:구성요소/성분/부분/부속/부품 ", h: "OO은 무엇들로 구성되어있죠?", a: ["이/가 무엇으로 이루어 졌는지 관심을 갖고,"],ah :["[예 : 컴퓨터]"])
    ],
    [
      TypeModel(t: "본질/요건/개념/다른 것과의 차이점", h: "OO는 어떤 거죠", a: ["이/가 어떤 것인지 호기심을 갖고,"],ah :["[예 : 친구]"]),
      TypeModel(t: "장점/효과/의의 : 단점/한계/문제점 ", h: "OO의 장점 또는 단점이 뭐죠?", a: ["의 장단점을 파악하고 싶어서,"],ah :["[예 : 핸드폰]"]),
      TypeModel(t: "사례/종류/갈래/구분/분류", h: "OO에는 어떤 것들이 있죠", a: ["에 어떤 것이 있는지 궁금해,"],ah :["[예 : 프로그래밍 언어]"]),
      TypeModel(t: "구조:구성요소/성분/부분/부속/부품 ", h: "OO은 무엇들로 구성되어있죠?", a: ["이/가 무엇으로 이루어 졌는지 관심을 갖고,"],ah :["[예 : 컴퓨터]"])
    ],
  ];




  savePost() {
    sharedPreferences.then((v) {
      v.setString(POSTKEY, json.encode(a));

    });
  }

  loadPost(){
    sharedPreferences.then((v) {
      a = jsonDecode(v.getString(POSTKEY));
    });
  }


  factory DataManager() {
    return _DataManager;
  }



  DataManager._internal();
}