
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {

  final List<String> _names = [];

  List<String> get names => _names;


  void addName({required name}){
    _names.add(name);
    notifyListeners();
  }


}