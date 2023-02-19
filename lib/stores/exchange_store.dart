import 'dart:convert';

import 'package:exchange_alarmi/access_info/app_access_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExchangeStore extends ChangeNotifier {
  var countryData = [];

  /*
  통화코드, 국가명 조회
   */
  getCountryCode(countryInitial) async {
    var result = await http.get(Uri.parse('$serverUrl/getData.do?code=$countryInitial'));
    var jsonData = jsonDecode(utf8.decode(result.bodyBytes));
    countryData = jsonData;
    print('store check');
    notifyListeners();
  }
}