import 'dart:convert';

import 'package:asaba/model/people_model.dart';
import 'package:asaba/pages.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PeopleProvider with ChangeNotifier {
  late People peopleList;

  Future<void> getPeople() async {
    var res = await http.get(Uri.parse("$globalURL/?results=20"));
    if (res.statusCode == 200) {
      peopleList = People.fromJson(json.decode(res.body));
      print(json.encode(peopleList));
      notifyListeners();
    }
  }
}
