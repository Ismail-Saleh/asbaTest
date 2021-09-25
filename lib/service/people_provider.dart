import 'dart:convert';

import 'package:asaba/model/people_model.dart';
import 'package:asaba/pages.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PeopleProvider with ChangeNotifier {
  late People peopleList;
  late List<Results> listResult, duplicateList = [];
  Future<void> getPeople() async {
    var res = await http.get(Uri.parse("$globalURL/?results=20"));
    if (res.statusCode == 200) {
      var decode = json.decode(res.body);
      peopleList = People.fromJson(json.decode(res.body));
      for (var item in decode['results']) {
        listResult.add(Results.fromJson(item));
      }
      print(listResult);
      notifyListeners();
    }
  }
}
