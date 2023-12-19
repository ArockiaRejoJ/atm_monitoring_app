import 'package:flutter/material.dart';

class AtmDetailsModel with ChangeNotifier {
  int? id;
  String? number;
  String? modelNumber;
  String? name;
  String? location;

  AtmDetailsModel({this.id, this.number, this.modelNumber, this.name, this.location});
}
