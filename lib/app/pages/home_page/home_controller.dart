
import 'package:flutter/material.dart';

class HomeController{

  final ValueNotifier<List<String>> _names = ValueNotifier<List<String>>([]);

  ValueNotifier<List<String>>  get names => _names;


  void addName({required name}){
    _names.value = List.from(_names.value)..add(name);
  }


}