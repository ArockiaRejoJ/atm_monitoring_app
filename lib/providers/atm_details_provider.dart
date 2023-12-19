import 'dart:convert';

import 'package:atm_apk/models/atm_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AtmDetailsProvider with ChangeNotifier {
  List<AtmDetailsModel> _listOfATMs = [];

  List<AtmDetailsModel> get listOfATMs {
    return [..._listOfATMs];
  }

  AtmDetailsProvider(this._listOfATMs);
  Future<void> fetchATMData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      final List<AtmDetailsModel> loadedData = [];
      extractedData.forEach(
        (data) {
          loadedData.add(
            AtmDetailsModel(
              id: data['id'],
              number: data['zipcode'],
              modelNumber: data['id'].toString(),
              name: data['name'],
              location: data['username'],
            ),
          );
        },
      );
      _listOfATMs = loadedData;
      notifyListeners();
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
