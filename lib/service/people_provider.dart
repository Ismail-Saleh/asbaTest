import 'dart:convert';

import 'package:asaba/model/people_model.dart';
import 'package:asaba/pages.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PeopleProvider with ChangeNotifier {
  late People peopleList;
  int count = 30;
  late List<Results> listResult = [];
  late List<Results> duplicate = [];
  late bool loading;
  Future<void> getPeople() async {
    loading = true;
    var res = await http.get(Uri.parse("$globalURL/?results=$count"));
    if (res.statusCode == 200) {
      var decode = json.decode(res.body);
      peopleList = People.fromJson(json.decode(res.body));
      for (var item in decode['results']) {
        listResult.add(Results.fromJson(item));
      }
      loading = false;
      notifyListeners();
    }
  }

  set setSearchlist(newValue) {
    duplicate = newValue;
    notifyListeners();
  }

  List<Results> get setSearchList => duplicate;
}
