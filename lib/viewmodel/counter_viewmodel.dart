import 'package:flutter/material.dart';
import '../model/counter_model.dart';

class CounterViewmodel extends ChangeNotifier{
  //Guarda el estado actual
  final CounterModel model=CounterModel(0);

  //Expone los datos a la vista
  int get count => model.count;

  //Provee las funciones de lògica
  void increment(){
    model.count++;
    notifyListeners();
  }
  void decrement(){
    model.count--;
    notifyListeners();
  }
  void reset() {
    model.count = 0;
    notifyListeners();
  }
}
